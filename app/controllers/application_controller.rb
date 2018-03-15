class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  protect_from_forgery with: :exception


  helper_method :current_user,
                :logged_in?

  private

  def authenticate_user!
    unless current_user
      store_location
      redirect_to login_path, alert: 'Проверьте почту или пароль'
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url if request.get?
  end
end
