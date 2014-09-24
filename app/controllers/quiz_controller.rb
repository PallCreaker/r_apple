class QuizController < ApplicationController
  before_action :authenticate_user!
  before_action :set_html_class

  def index
    #confirm_status
    @title = '単語テスト中'
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
    #binding.pry
    raw = params
    Score.create(user_id: current_user.id, score: raw[:score])
    if current_user.status == "complete_name"
      current_user.status = "complete_quiz"
      current_user.save
    end
    # あとで結果画面の遷移に切り替える
    render json: raw
		#render :js => "window.location.pathname = '#{root_path}'"
  end

  private
    def set_html_class
      @style_class = 'normal'
    end
end
