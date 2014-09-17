class RegistrationController < ApplicationController
before_action :set_user, only: [:index, :edit, :update]
  def index
  end
  def edit
  end
  def update
    redirect_to :controller => "registration", :action => "index"
  end
end

private
def set_user
  @user = current_user
end
