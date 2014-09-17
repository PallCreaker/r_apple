class ApplicationController < ActionController::Base
  private
  def sign_in_required
      redirect_to root_path unless user_signed_in?
  end
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
