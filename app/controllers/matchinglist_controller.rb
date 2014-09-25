class MatchinglistController < ApplicationController
  before_action :authenticate_user!
  before_action :set_html_class

  def index
    @title = '宣戦布告する相手を選ぼう'
    confirm_status unless current_user.complete_quiz?

    my_score = Score.where(user_id:current_user.id).maximum("score")
    if current_user.gender == 0
      @users = User.joins(:scores).where("gender = ? and university = ? and score > ?", 1, current_user.university, my_score).uniq
    else
      @users = User.joins(:scores).where("gender = ? and university = ? and score > ?", 0, current_user.university, my_score).uniq
    end

    if @users.count <= 5
      if current_user.gender == 0
        @users = User.joins(:scores).where("gender = ? and score > ?", 1, my_score).uniq 
      else
        @users = User.joins(:scores).where("gender = ? and score > ?", 0, my_score).uniq 
      end
    end

    if @users.count <= 5
      if current_user.gender == 0
        @users = User.where("gender = ?", 1).uniq
      else
        @users = User.where("gender = ?", 1).uniq
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
