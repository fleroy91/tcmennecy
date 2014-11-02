jQuery ->
	$("#clear").click (e)->
		e.preventDefault()
		$("#sublect").val("")
		$("#message").val("")

	$("#send").click (e)->
		e.preventDefault()
		subject = $("#subject").val()
		body = $("#message").val()
		window.open "mailto:tc.mennecy@fft.fr?subject=" + encodeURIComponent(subject) + "&body=" + encodeURIComponent(body), "_blank"
