class QuizController < ApplicationController
  def index
  end

  def selection
  	render json: params.to_json
  end
end
