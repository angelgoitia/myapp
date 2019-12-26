class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :cedula, :role])
  end

  def authenticate_user?
    redirect_to root_path unless user_signed_in? && current_user
  end

  def authenticate_admin?
    redirect_to root_path unless user_signed_in? && current_user
  end
end
