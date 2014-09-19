class RegistrationController < ApplicationController
	before_action :authenticate_user!, only: [:edit, :update]

  def index
		if user_signed_in?
			redirect_to '/registration/edit'
		end
  end

  def edit
		confirm_status
  end

  def update
		if current_user.update(user_params)
			current_user.status = 1
			current_user.save
			#quiz画面に飛ばすように変更する
			redirect_to :controller => "quiz", :action => "index"
		else
			render 'edit'
		end
  end
	private
	def user_params
		params.require(:user).permit(:university, :user_name, :status)
	end
end


