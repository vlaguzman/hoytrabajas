class ApplicationController < ActionController::Base

private

  def after_sign_in_path_for(resource)
    new_users_profile_path    
  end
end
