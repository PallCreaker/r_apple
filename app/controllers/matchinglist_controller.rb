class MatchinglistController < ApplicationController
  before_action :authenticate_user!, :set_html_class

  def index
    @title = '宣戦布告する相手を選ぼう'
    confirm_status unless current_user.complete_quiz?
    my_score = Score.my_score(current_user.id).maximum("score")

    if current_user.gender == "male"
      @users = User.univ(current_user.university).score(my_score).gender("female")
    else
      @users = User.univ(current_user.university).score(my_score).gender("male")
    end

    if @users.count <= 5
      if current_user.gender == "male"
        @users = User.score(my_score).gender("female")
      else
        @users = User.score(my_score).gender("male")
      end
    end

    if @users.count <= 5
      if current_user.gender == "male"
        @users = User.gender("female")
      else
        @users = User.gender("male")
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
