class QuizController < ApplicationController
  def index
  end

  def selection
  	render json: Quiz.all.sample(1).first.to_json
  end
end
