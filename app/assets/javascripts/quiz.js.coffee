# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
scoring = (quiz) ->
  all_count = quiz.correct + quiz.incorrect
  score = 10 * quiz.correct / all_count
  return score

ready = ->
	$(".choices").on "click", ->
		$.ajax
			url: "selection"
			type: "GET"
			data:
				hoge: $(this).text()
				id: 1
				correct: true

			dataType: "json"
			success: (data) ->
				console.log(data)
				return

			error: (data) ->
				console.log(data)
				return
		return

$(document).ready(ready)
$(document).on('page:load', ready)