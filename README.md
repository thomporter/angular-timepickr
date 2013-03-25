<!DOCTYPE html>
<html>
<title>Hello Strapdown</title>

<xmp theme="united" style="display:none;">
# Angular Timepickr

Inspired by [http://haineault.com/media/jquery/ui-timepickr/page/](http://haineault.com/media/jquery/ui-timepickr/page/)

Currently a long ways off from the inspiration.

## Limitations 

1.  No 24 hour option
2.  Restricted to minutes on the 5s (:00, :05, :10, etc)  The directive rounds to nearet selectable minute on load...
3.  Embeded on page - no "mouse over" features (yet)
4.  Only tested in Chrome

## Usage

HTML
```
<div ng-controller="DemoCtrl"> 
	<input ng-model="test_time"> <!-- Not Required --> 
	<timepickr ng-model="test_time" /> 
</div>
```

JavaScript
```
angular.module('myApp', ['timepickr']).controller('testCtrl', function($scope){
	$scope.test_time = '05:00 pm';
});
```

## Demo

Visit the demo at [angular-timepickr.thomporter.com](http://angular-timepickr.thomporter.com)
</xmp>

<script src="http://strapdownjs.com/v/0.2/strapdown.js"></script>
</html>