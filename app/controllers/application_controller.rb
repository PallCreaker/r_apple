class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    # after login, redirect to Registration_controller
    registration_index_path
  end

  private
  def confirm_status
    case current_user.status
    when "temporary" then
      redirect_to '/registration/index'
    when "complete_name_and_university" then
      redirect_to '/quiz/index'
    when "complete_quiz" then
      redirect_to '/matchinglist/index'
    when "complete_enemy" then
      redirect_to '/'
    end
  end
end
