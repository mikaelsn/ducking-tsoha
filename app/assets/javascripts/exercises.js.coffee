# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
	$('#exercise_time').datepicker({ dateFormat: 'yy-mm-dd'})
	
	Morris.Line
		element: 'graph'
		data: $('#graph').data('activity')
		xkey: 'time'
		ykeys: ['weight']
		labels: ['Weight']