class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    worlds_path
  end
end