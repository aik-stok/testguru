class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  protect_from_forgery with: :exception

protected

def after_sign_in_path_for(resource)
  flash[:success] = "Привет, #{current_user.name}"
  if resource.class == Admin
    admin_tests_path 
  else
    root_path 
  end
end


  

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :last_name])
  end
end
