class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name], [:first_name_z], [:last_name_z], [:first_name_k], [:last_name_k], [:birthday])
  end
end
