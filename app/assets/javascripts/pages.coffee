# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
		
	jQuery ->

		$('.clickable-toggle-option').click (window.event), ->
			$('.clickable-toggle-option').removeClass('active')
			$(@).addClass('active')
			targetId = "#" + $(@).data("option-toggle-id")
			toggleObject = $('body').find(targetId)
			if $(@).data("toggle-value")
				toggleObject.prop("checked", true)
			else
				toggleObject.prop("checked", false)

      		
$(document).on('turbolinks:load', ready)

