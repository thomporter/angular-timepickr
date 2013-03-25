
angular.module('timepickr', []).directive('timepickr', ()->
	return {
		restrict: 'E'
		scope: 
			model: '=ngModel' #binds whatever ngModel refrences to $scope.model
		replace: true
		transclude: true
		template: '<div class="timepickr">' +
			'<ol class="timepickr_row timepickr_h" data-for="hour"><li>01</li><li>02</li><li>03</li><li>04</li><li>05</li><li>06</li><li>07</li><li>08</li><li>09</li><li>10</li><li>11</li><li>12</li></ol>' +
			'<ol class="timepickr_row timepickr_m" data-for="minute"><li>00</li><li>05</li><li>10</li><li>15</li><li>20</li><li>25</li><li>30</li><li>35</li><li>40</li><li>45</li><li>50</li><li>55</li></ol>' +
			'<ol class="timepickr_row timepickr_ampm" data-for="ampm"><li>am</li><li>pm</li></ol>' +
			'</div>'
		
		# controller
		controller: ($scope, $attrs) ->
			
			# accepts a piece of the time and where to put it... 
			$scope.setData = (data_for, data) ->
				
				# first, get the hour, min & ampm of the current model value
				h = $scope.model.substr(0,2)
				m = $scope.model.substr(3,2)
				a = $scope.model.substr(6,2)
				
				# now update the appropriate part of the time based on data_for
				if (data_for == 'hour')
					h = data
				else if (data_for == 'minute')
					m = data
				else
					a = data
				
				# now set the model value
				$scope.model = h + ':' + m + ' ' + a
				
				$scope.$apply()
		
		
		# currently no compilers needed, just the linking function...
		link: (scope, iElem, iAttrs) ->
			
			# place to store if we've loaded the default value
			defaultLoaded = false 
			
			# load the default value
			scope.$watch('model', (v) ->
				# bail if v i undefinefd, or if we've already loaded the default.
				return if v == undefined || defaultLoaded
				defaultLoaded = true
				
				# get hour, min & am/pm
				h = v.substr(0,2)
				m = v.substr(3,2)
				a = v.substr(6,2).toLowerCase()
				
				# change minutes to nearest multiple of 5
				mod = parseInt(m) % 5
				if (mod)
					if mod > 2
						m = parseInt(m) + (5-mod)
					else
						m = parseInt(m) - mod
				
				
				# make min a string again
				m = m.toString()
				
				# add the 0 back to the front of min if needed.
				m = '0' + m if (m.length<2)
				
				# select the correct hour
				angular.forEach( angular.element(iElem.children()[0]).children(), (li) ->
					angular.element(li).addClass('active') if li.innerHTML == h
				)
				
				# select the correct minute
				angular.forEach( angular.element(iElem.children()[1]).children(), (li) ->
					angular.element(li).addClass('active') if li.innerHTML == m
				)
				
				# select the correct am/pm
				angular.forEach( angular.element(iElem.children()[2]).children(), (li) ->
					angular.element(li).addClass('active') if li.innerHTML == a
				)
			)
			
			# setup event listeners
			angular.forEach iElem.children(), (ol) ->
				angular.forEach ol.children, (li) ->
					
					# add the listener
					li.addEventListener('click', ()->
						
						e = angular.element(this)
						
						# remove active
						angular.forEach e.parent().children(), (c) ->
							angular.element(c).removeClass('active')
							
						e.addClass('active')
						df = e.parent().attr('data-for')
						scope.setData(df,e.html())
					)
			
				
	}
)