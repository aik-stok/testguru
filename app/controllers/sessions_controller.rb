class SessionsController < ApplicationController

  skip_before_action :authenticate_user!

  def new
  end
  
  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies[:last_page] 
      cookies[:last_page] = nil
    else
      flash.now[:alert] = "Enter login and password"
      render 'new'
    end
  end
  
  def destroy
    @current_user = nil
    session[:user_id] = nil
    redirect_to login_path
  end
end
