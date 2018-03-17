class Admin::BaseController < ApplicationController

  layout 'admin'

  before_action :admin_required!

  private

  def admin_required!
    redirect_to root_path, alert: 'У вас не достаточно прав для отображения этой страницы.' unless current_user.is_a?(Admin)
  end

end