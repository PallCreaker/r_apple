# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

time = 0
timerID = 0
quiz = 0
score = 0


StartTimer = ->
	timerID = setInterval(Timer, 1000)
	return


StopTimer = ->
	clearInterval(timerID)
	return


Timer = ->
	time = time + 1
	if time == 180
		StopTimer()
		$.ajax
			url: "complete"
			type: "GET"
			data:
				score: score
			dataType: "json"
			success: (data) ->
				#あとで消す
				alert(data.score)
				return
			error: (data) ->
				return


scoring = (q) ->
	all_count = q.correct_count + q.incorrect_count
	point = Math.floor(10 * q.incorrect_count / all_count)+1
	return point


shuffleArray = (array) ->

	i = array.length - 1

	while i > 0
	    j = Math.floor(Math.random() * (i + 1))
	    temp = array[i]
	    array[i] = array[j]
	    array[j] = temp
	    i--
	return array


next_quiz = (q) ->
	quiz = q
	choices = [q.ans1, q.ans2, q.ans3, q.ans4]
	shuffleArray(choices)
	$(".problem").text(q.problem)
	$(".choice1").text(choices[0])
	$(".choice2").text(choices[1])
	$(".choice3").text(choices[2])
	$(".choice4").text(choices[3])


judge = (q, text)->
	if text == q.ans1
		return 1
	else
		return 2


ready = ->
	$(".choices").on "click", ->
		text = $(this).text()
		console.log(score)
		if judge(quiz, text) == 1
			score = score + scoring(quiz)
		else
			score = score - (10 - scoring(quiz))
		console.log(scoring(quiz))
		$(".score").text("スコア" + score);
		$.ajax
			url: "selection"
			type: "GET"
			data:
				judge: true
				id: quiz.id
				correct: judge(quiz, text)

			dataType: "json"
			success: (data) ->
				next_quiz(data)
				return

			error: (data) ->
				return
		return


$(document).ready(ready)
$(document).on('page:load', ready)

StartTimer()
$.ajax
	url: "selection"
	type: "GET"
	dataType: "json"
	success: (data) ->
		next_quiz(data)
		return

	error: (data) ->
		return
