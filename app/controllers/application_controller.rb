class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
  def after_sign_in_path_for(resource)
    user_path(@user)
  end
  protected
  def configure_permitted_parameters
  	added_attrs = [:email,:name,:password,:password_confirmati,:introduction,:profile_image_id]
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:password,:password_confirmati,:email])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name,:profile_image_id,:introduction])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name,:password])
  end
end
