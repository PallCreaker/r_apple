class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  def confirm_status
    if current_user.status == 1
      # quiz画面に遷移
      redirect_to '/quiz/index'
    elsif current_user.status == 2
      # list画面に飛ばすように変更する
      redirect_to '/matchinglist/index'
    elsif current_user.status == 3
      # 対戦画面に飛ばすように変更する
      # redirect_to '/registration/index'
    end
  end
end
