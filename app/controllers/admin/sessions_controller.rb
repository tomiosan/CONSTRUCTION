# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  def after_sign_up_path_for(resource)
    admins_path(resource)
  end

  def configure_sign_up_params
    device_parameter_sanitizer.permit(:sign_up, keys: [:name,
                                                       :postal_code,
                                                       :address,
                                                       :phone_number
                                                       ])
  end
end
