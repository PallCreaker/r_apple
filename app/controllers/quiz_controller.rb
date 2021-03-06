class QuizController < ApplicationController
  before_action :authenticate_user!
  before_action :set_html_class

  def index
    confirm_status if current_user.temporary?
    @title = '単語テスト中'
  end

  def selection
    if params[:judge]
      quiz = Quiz.find(params[:id])
      if params[:correct] == "1"
        quiz.update(correct_count:quiz.correct_count+1)
      elsif params[:correct] == "2"
        quiz.update(incorrect_count:quiz.incorrect_count+1)
      end
      quiz.save
    end
    render json: Quiz.all.sample(1).first.to_json
  end

  def complete
    raw = params
    Score.create(user_id: current_user.id, score: raw[:score])
    if current_user.complete_name_and_university?
      current_user.complete_quiz!
    end
    render json: raw
  end

  private
    def set_html_class
      @style_class = 'normal'
    end
end
