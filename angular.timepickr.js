// Generated by CoffeeScript 1.3.3

angular.module('timepickr', []).directive('timepickr', function() {
  return {
    restrict: 'E',
    scope: {
      model: '=ngModel'
    },
    replace: true,
    transclude: true,
    template: '<div class="timepickr">' + '<ol class="timepickr_row timepickr_h" data-for="hour"><li>01</li><li>02</li><li>03</li><li>04</li><li>05</li><li>06</li><li>07</li><li>08</li><li>09</li><li>10</li><li>11</li><li>12</li></ol>' + '<ol class="timepickr_row timepickr_m" data-for="minute"><li>00</li><li>05</li><li>10</li><li>15</li><li>20</li><li>25</li><li>30</li><li>35</li><li>40</li><li>45</li><li>50</li><li>55</li></ol>' + '<ol class="timepickr_row timepickr_ampm" data-for="ampm"><li>am</li><li>pm</li></ol>' + '</div>',
    controller: function($scope, $attrs) {
      return $scope.setData = function(data_for, data) {
        var a, h, m;
        h = $scope.model.substr(0, 2);
        m = $scope.model.substr(3, 2);
        a = $scope.model.substr(6, 2);
        if (data_for === 'hour') {
          h = data;
        } else if (data_for === 'minute') {
          m = data;
        } else {
          a = data;
        }
        $scope.model = h + ':' + m + ' ' + a;
        return $scope.$apply();
      };
    },
    link: function(scope, iElem, iAttrs) {
      var defaultLoaded;
      defaultLoaded = false;
      scope.$watch('model', function(v) {
        var a, h, m, mod;
        if (v === void 0 || defaultLoaded) {
          return;
        }
        defaultLoaded = true;
        h = v.substr(0, 2);
        m = v.substr(3, 2);
        a = v.substr(6, 2).toLowerCase();
        mod = parseInt(m) % 5;
        if (mod) {
          if (mod > 2) {
            m = parseInt(m) + (5 - mod);
          } else {
            m = parseInt(m) - mod;
          }
        }
        m = m.toString();
        if (m.length < 2) {
          m = '0' + m;
        }
        angular.forEach(angular.element(iElem.children()[0]).children(), function(li) {
          if (li.innerHTML === h) {
            return angular.element(li).addClass('active');
          }
        });
        angular.forEach(angular.element(iElem.children()[1]).children(), function(li) {
          if (li.innerHTML === m) {
            return angular.element(li).addClass('active');
          }
        });
        return angular.forEach(angular.element(iElem.children()[2]).children(), function(li) {
          if (li.innerHTML === a) {
            return angular.element(li).addClass('active');
          }
        });
      });
      return angular.forEach(iElem.children(), function(ol) {
        return angular.forEach(ol.children, function(li) {
          return li.addEventListener('click', function() {
            var df, e;
            e = angular.element(this);
            angular.forEach(e.parent().children(), function(c) {
              return angular.element(c).removeClass('active');
            });
            e.addClass('active');
            df = e.parent().attr('data-for');
            return scope.setData(df, e.html());
          });
        });
      });
    }
  };
});
