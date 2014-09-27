# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

time = 0
timerID = 0
quiz = 0
score = 0
intro_time = 5
time_limit = 90


StartTimer = ->
    timerID = setInterval(Timer, 1000)
    return


StopTimer = ->
    clearInterval(timerID)
    return


Timer = ->
    if intro_time > 0
        $(".introduction_text").text((intro_time));
        intro_time = intro_time-1
    else
        $('.introduction').addClass("hide");
        $('.playing').removeClass("hide");
        time = time + 1
        $('div.progress-bar').css('width',100*time/time_limit+'%');
        $('span.time-limit').text(time_limit-time);

    if time == time_limit
        StopTimer()
        $('.playing').addClass("hide");
        $('.result').removeClass("hide");
        setTimeout(complete, 3000)


complete = ->
    $.ajax
        url: "complete"
        type: "GET"
        data:
            score: score
        success: (data) ->
            window.location.pathname = '/matchinglist/index'
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
    # TODO: sleep処理を正しい場所。あと二度押しできるので改善
    sleep 500
    $('.correct-flag').addClass("hide");
    $('.batu-flag').addClass("hide");
    quiz = q
    choices = [q.ans1, q.ans2, q.ans3, q.ans4]
    shuffleArray(choices)
    $(".problem").text(q.problem)
    for i in [1..4]
        $("#ch" + i).empty() #onにした画像を読み込み時に、消す
        $("#ch" + i).append('<img src="/img/number-' + i + '_off.png"><p class="choice' + i + '">' + choices[i-1] + '</p>')


judge = (q, text)->
    if text == q.ans1
        return 1
    else
        return 2


sleep = (ms) ->
    start = new Date().getTime()
    continue while new Date().getTime() - start < ms


ready = ->
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

    $(".choices").on "click", ->
        # click 時に、画像をoff -> onにする
        $(this ).find('img').attr('src', $(this).find('img').attr('src').replace('_off', '_on'));
        text = $(this).text()
        console.log(score)
        if judge(quiz, text) == 1
            score = score + scoring(quiz)
            $('.correct-flag').removeClass("hide")
        else
            score = score - (10 - scoring(quiz))
            $('.batu-flag').removeClass("hide")
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

