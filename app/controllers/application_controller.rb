# frozen_string_literal: true

class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :set_language

  # def set_language
  #   if user_signed_in?
  #     if current_user.language == "English"
  #       I18n.locale = :en
  #     elsif current_user.language == "Filipino"
  #       I18n.locale = :tl
  #     end
  #   end
  # end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:email, :language, :password, :password_confirmation)
    end
  end

  def after_sign_in_path_for(_resource)
    journals_path # your path
  end
end
