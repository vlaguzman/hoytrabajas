class ApplicationController < ActionController::Base
  private

  def after_sign_in_path_for(resource)
    edit_users_path
  end
end
