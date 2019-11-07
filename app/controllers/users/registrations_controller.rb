# frozen_string_literal: true
class Users::RegistrationsController < Devise::RegistrationsController
  protected

  def after_inactive_sign_up_path_for(resource)
    if resource.email === ("julian.vargas@hoytrabajas.com")
      active_for_authentication?
      users_wizards_step_zero_path
    else
      users_wizards_step_zero_path
    end
  end

end
