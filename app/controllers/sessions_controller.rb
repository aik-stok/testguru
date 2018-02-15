class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to tests_path 
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
