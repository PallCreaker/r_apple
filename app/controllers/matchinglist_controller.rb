class MatchinglistController < ApplicationController
  before_action :authenticate_user!, :set_html_class

  def index
    @title = '宣戦布告する相手を選ぼう'
    confirm_status unless current_user.complete_quiz?
    my_score = Score.my_score(current_user.id).maximum("score")

    if current_user.gender == 0
      @users = User.gender_filter(1).score_filter(my_score).university_filter(current_user.university)
    else
      @users = User.gender_filter(0).score_filter(my_score).university_filter(current_user.university)
    end

    if @users.count <= 5
      if current_user.gender == 0
        @users = User.gender_filter(1).score_filter(my_score)
      else
        @users = User.gender_filter(0).score_filter(my_score)
      end
    end

    if @users.count <= 5
      if current_user.gender == 0
        @users = User.gender_filter(1)
      else
        @users = User.gender_filter(2)
      end
    end
  end

  def create
    Competition.create(user_id: current_user.id , enemy_id: params[:enemy_id])
    current_user.complete_enemy!
    redirect_to "/"
  end

  private
    def set_html_class
      @style_class = 'reversal'
    end
end
