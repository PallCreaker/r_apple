class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    confirm_status
    @competition = Competition.where(competition_id: current_user.id)
  end
end
