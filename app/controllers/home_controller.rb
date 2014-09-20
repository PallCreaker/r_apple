class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    confirm_status
    @competition_username = Competition.where(user_id:current_user.id).last.competition_user.user_name
    @myscore = Score.where(user_id:current_user.id).maximum('score')
    @enemyscore = Score.where(user_id:Competition.where(user_id:current_user.id)).maximum('score')
    @create_result = Competition.where(user_id:current_user.id).last.created_at
  end
end
