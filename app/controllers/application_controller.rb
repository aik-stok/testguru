class ApplicationController < ActionController::Base
 before_action :authenticate_user!
  protect_from_forgery with: :exception
  
  helper_method :current_user,
                :logged_in? 

  private

  def authenticate_user! 
    unless current_user
      cookies[:last_page] = request.original_url
      redirect_to login_path
    end
  end
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end
end
