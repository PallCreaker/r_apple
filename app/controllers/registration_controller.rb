class RegistrationController < ApplicationController
before_action :authenticate_user!

  def index
  end

  def edit
		confirm_status
  end

  def update
		if current_user.update(user_params)
			current_user.status = 1
			#quiz画面に飛ばすように変更する
			redirect_to :controller => "registration", :action => "index"
		else
			render 'edit'
		end
  end
	private
	def user_params
		params.require(:user).permit(:university, :user_name, :status)
	end
end


