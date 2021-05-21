# frozen_string_literal: true

class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger

  def after_sign_in_path_for(_resource)
    journals_path # your path
  end
end
