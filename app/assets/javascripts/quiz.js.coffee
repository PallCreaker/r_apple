# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


scoring = (quiz) ->
	all_count = quiz.correct_count + quiz.incorrect_count
	score = Math.floor(10 * quiz.correct_count / all_count)
	return score


shuffleArray = (array) ->

	i = array.length - 1

	while i > 0
	    j = Math.floor(Math.random() * (i + 1))
	    temp = array[i]
	    array[i] = array[j]
	    array[j] = temp
	    i--
	return array


next_quiz = (quiz) ->

	choices = [quiz.ans1, quiz.ans2, quiz.ans3, quiz.ans4]
	shuffleArray(choices)
	$(".problem").text(quiz.problem)
	$(".choice1").text(choices[0])
	$(".choice2").text(choices[1])
	$(".choice3").text(choices[2])
	$(".choice4").text(choices[3])


judge = (quiz, text)->
	if text == quiz.ans1
		return true
	else
		return false


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