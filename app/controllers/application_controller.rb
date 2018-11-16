class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def configure_permitted_parameters
    #sign_inの時に、group_keyも許可する
      devise_parameter_sanitizer.permit(:sign_in, keys:[:group_key])
    #sign_upの時に、group_keyも許可する
      devise_parameter_sanitizer.permit(:sign_up, keys:[:group_key])
    #account_updateの時に、group_keyも許可する
      devise_parameter_sanitizer.permit(:account_update, keys:[:group_key])
  end
end
