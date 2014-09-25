class RegistrationController < ApplicationController
  before_action :authenticate_user!

  def index
    confirm_status unless current_user.temporary?
    @title = '大学名を入力してください'
  end

  def update
    if current_user.update(user_params)
      current_user.complete_name_and_university!
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


