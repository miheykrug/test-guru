class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new create]

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_back_or root_path
    else
      flash.now[:alert] = 'Неверные почта или пароль'
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_url
  end
end
