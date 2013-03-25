<!DOCTYPE html>
<html>
<title>Angular Timepickr</title>

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

```
<div ng-controller="DemoCtrl"> 
	<input ng-model="test_time"> <!-- Not Required --> 
	<timepickr ng-model="test_time" /> 
</div>
```
</xmp>

<script src="http://strapdownjs.com/v/0.2/strapdown.js"></script>