angular.module('DemoApp', ['timepickr'])
	.controller('DemoCtrl', ($scope)->
		$scope.test_time = '05:27 PM'
		$scope.data = 
			test_time: '12:12 am'

	)
