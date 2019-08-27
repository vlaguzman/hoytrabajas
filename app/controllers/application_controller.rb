class ApplicationController < ActionController::Base

private

  def after_sign_in_path_for(resource)
    users_profile_path    
  end
end
