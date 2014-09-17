class RegistrationController < ApplicationController
before_action :set_user, only: [:index, :edit, :update]

  def index
  end

  def edit
  end

  def update
		if user_signed_in?
			if @user.update(user_params)
				@user.status = 1
				redirect_to :controller => "registration", :action => "index"
			else
				render 'edit'
			end
		else
			render 'index'
		end
  end
	private
	def set_user
		@user = current_user
	end
	def user_params
		params.require(:user).permit(:university, :user_name, :status)
	end
end


