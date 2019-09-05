class ApplicationController < ActionController::Base

  private

  def after_sign_in_path_for(resources)
    edit_users_path
  end
end