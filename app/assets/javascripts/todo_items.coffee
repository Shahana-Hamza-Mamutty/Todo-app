# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "turbolinks:load", -> 
	$('#add-task').submit ->
		console.log($(this).serialize())
		$.ajax '/todo_items',
		    type: 'POST'
		    data: $(this).serialize()
		    error: (jqXHR, textStatus, errorThrown) ->
		      console.log("AJAX Error: #{textStatus}")
		    success: (data, textStatus, jqXHR) ->
		    $('form input[name="title"]').val("")
					#$('#pay_mtc').removeAttr('disabled')
		      console.log("Success")
		false

	$(".alert").delay(1000).fadeOut(3000);  