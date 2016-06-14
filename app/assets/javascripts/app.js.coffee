(($) ->
	
	ready = ->
		$('table > tbody > tr[data-href]').on "click", (event) ->
			event.stopPropagation()
			console.log $(this)
			Turbolinks.visit $(this).data 'href'
			
	$(document).ready ready
	$(document).on 'page:load', ready
) jQuery
