class QuizController < ApplicationController
  def index
  end

  def selection
  	if params[:judge]
  		quiz = Quiz.find(params[:id])
  		if params[:correct]
	  		quiz.update(correct_count: quiz.correct_count+1)
	  	else
	  		quiz.update(incorrect_count: quiz.incorrect_count+1)
  		end
  		quiz.save
  	end
  	render json: Quiz.all.sample(1).first.to_json
  end
end
