# frozen_string_literal: true

class Public::Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, only: [:create]
  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end
  def after_sign_up_path_for(resource)
      #beybug
      root_path
  end  
  #private

  def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, 
          keys:[
            :last_name, 
            :first_name, 
            :sub_last_name, 
            :sub_first_name, 
            :postal_code, 
            :address, 
            :phone_number 
          ])
  end
end
