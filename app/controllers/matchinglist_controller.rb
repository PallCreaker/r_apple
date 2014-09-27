class MatchinglistController < ApplicationController
  before_action :authenticate_user!, :set_html_class

  def index
    @title = '宣戦布告する相手を選ぼう'
    confirm_status unless current_user.complete_quiz?
    my_score = Score.my_score(current_user.id).maximum("score")
    if current_user.gender == 0
      @users = User.univ(current_user.university).score(my_score).gender(1)
    else
      @users = User.univ(current_user.university).score(my_score).gender(0)
    end

    if @users.count <= 5
      if current_user.gender == 0
        @users = User.score(my_score).gender(1)
      else
        @users = User.score(my_score).gender(0)
      end
    end

    if @users.count <= 5
      if current_user.gender == 0
        @users = User.gender(1)
      else
        @users = User.gender(2)
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
