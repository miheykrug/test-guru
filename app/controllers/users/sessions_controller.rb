class Users::SessionsController < Devise::SessionsController

  def create
    super
    set_flash_message!(:info, :login, first_name: resource.first_name) if is_flashing_format?
  end

end
