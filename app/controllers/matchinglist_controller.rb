class MatchinglistController < ApplicationController
  before_action :authenticate_user!
  before_action :set_html_class

  def index
    @title = '宣戦布告する相手を選ぼう'
    if current_user.status != 2
      confirm_status
    end
    @competition = Competition.all
    if current_user.gender == 0
      @users = User.where("gender = ? and university = ?", 1, current_user.university)
    else
      @users = User.where("gender = ? and university = ?", 0, current_user.university)
    end
    
  end

  def create
    Competition.create(user_id: current_user.id , competition_id: params[:competition_id])
    current_user.status = 3
    current_user.save
    # あとで対戦画面への遷移に変更する
    redirect_to "/"
  end

  private
    def set_html_class
      @style_class = 'reversal'
    end
end

