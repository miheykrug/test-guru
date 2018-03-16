class Users::SessionsController < Devise::SessionsController

  def create
    def create
      self.resource = warden.authenticate!(auth_options)
      set_flash_message!(:notice, :signed_in, :first_name => resource.first_name) if is_flashing_format?
      sign_in(resource_name, resource)
      yield resource if block_given?
      respond_with resource, location: after_sign_in_path_for(resource)
    end
  end

end
