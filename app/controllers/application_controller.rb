class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :exception

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end

  def after_sign_in_path_for(resource)
    resource.is_a?(Admin) ? admin_tests_path : super
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end
end
