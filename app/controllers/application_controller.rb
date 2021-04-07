class ApplicationController < ActionController::Base

  add_flash_types :success, :info, :warning, :danger

  def after_sign_in_path_for(resource)
    journals_path # your path
  end

  
end
