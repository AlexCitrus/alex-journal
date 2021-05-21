# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
    # before_action :configure_sign_in_params, only: [:create]

    # GET /resource/sign_in
    # def new
    #   super
    # end

    def create
      self.resource = warden.authenticate!(auth_options)
      if resource.language == "English"
        I18n.locale = :en
      elsif resource.language == "Filipino"
        I18n.locale = :tl
      end
      flash[:notice] = I18n.t(:sign_in)
      sign_in(resource_name, resource)
      yield resource if block_given?
      respond_with resource, location: after_sign_in_path_for(resource)
    end

    # DELETE /resource/sign_out
    def destroy
      signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
      flash[:notice] = I18n.t(:sign_out) if signed_out
      yield if block_given?
      respond_to_on_destroy
    end

    # protected

    # If you have extra params to permit, append them to the sanitizer.
    # def configure_sign_in_params
    #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
    # end
  end
end
