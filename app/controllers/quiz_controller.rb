class QuizController < ApplicationController
  
  before_action :authenticate_user!

  def index
  end

  def selection
    if params[:judge]
      quiz = Quiz.find(params[:id])
      if params[:correct] == "1"
        quiz.update(correct_count: quiz.correct_count+1)
      elsif params[:correct] == "2"
        quiz.update(incorrect_count: quiz.incorrect_count+1)
      end
      quiz.save
    end
    render json: Quiz.all.sample(1).first.to_json
  end

  def complete
    raw = params
    Score.create(user_id: current_user.id, score: raw[:score])
    if current_user.status == 1
      current_user.status = 2
      current_user.save
    end
    #　あとで結果画面の遷移に切り替える
    render json: raw
  end
end
