class Admin::BaseController < ApplicationController

  layout 'admin'

  before_action :authenticate_user!
  before_action :admin_required!

  private

  def admin_required!
    redirect_to root_path, alert: 'У вас не достаточно прав для отображения этой страницы.' unless current_user.is_a?(Admin)
  end

  def after_sign_in_path_for(resource)
    admin_tests_path
  end
end