class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  def authorize_admin
    redirect_to root_path, alert: 'Access Denied' unless current_user.try(:admin?)
  end
def current_user?(user)
current_user.id == user.id
end
helper_method :current_user?
protected

  def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :password, :email, :password_confirmation, :remember_me])
     devise_parameter_sanitizer.permit(:sign_in, keys: [:login, :username, :password, :email, :remember_me])
     devise_parameter_sanitizer.permit(:account_update, keys: [:username, :password, :phone, :email, :password_confirmation, :current_password, :avatar])
  end
end
