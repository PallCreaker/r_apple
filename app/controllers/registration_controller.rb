class RegistrationController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.status != "temporary"
      confirm_status
    end
    @title = '大学名を入力してください'
  end

  def update
    if current_user.update(user_params)
      current_user.status = "complete_name"
        if current_user.save!
          redirect_to :controller => "quiz", :action => "index"
        end
    else
      render 'index'
    end
  end

  private
  def user_params
    params.require(:user).permit(:university, :user_name, :status)
  end
end


