class LoginController < ApplicationController
before_action :set_user, only: [:index, :edit, :update]
  def index
    @users = User.all
  end
  def edit
  end
  def update
    redirect_to :controller => "login", :action => "index"
  end

end

private
def set_user
  @user = current_user
end
