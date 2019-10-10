# frozen_string_literal: true
class Users::RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
     resource.save
     users_wizards_step_zero_path
  end

  def after_inactive_sign_up_path_for(resource)
    resource.confirmed_at = DateTime.now
    resource.save
    users_wizards_step_zero_path
  end

end
