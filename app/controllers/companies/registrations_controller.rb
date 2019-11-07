# frozen_string_literal: true
class Companies::RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_company!

  protected

  def after_inactive_sign_up_path_for(resource)
    companies_first_offer_step_zero_path
  end

end
