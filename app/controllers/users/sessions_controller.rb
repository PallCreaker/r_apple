class Users::SessionsController < Devise::SessionsController
  before_action :set_html_class
  
  def new
    super
  end

  def create
    super
  end

  def destroy
    super
  end
  private
    def set_html_class
      @style_class = 'display-none'
      @style_content = 'login'
    end
end
