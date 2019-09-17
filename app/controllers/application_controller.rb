class ApplicationController < ActionController::Base
  private

  def after_sign_in_path_for(resource)
    params_origin = resource.class.name.underscore.to_sym
    if params_origin.eql?(:company)
      edit_companies_path
    else
      edit_users_path
    end
  end

end
