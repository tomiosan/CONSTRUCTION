class ApplicationController < ActionController::Base
   before_action :configure_permitted_parameters, if: :devise_controller?

   before_action :authenticate_admin!

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :postal_code, :address, :phone_number])
  end
end
