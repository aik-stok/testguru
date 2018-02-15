class UsersController < ApplicationController

  skip_before_action :authenticate_user!


  def new
    @user = User.new
  end

 def create 
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      @current_user = @user
      redirect_to tests_path
    else
      render 'new'
    end
  end
  
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name)
  end
end
