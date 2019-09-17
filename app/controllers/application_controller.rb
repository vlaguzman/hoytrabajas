class ApplicationController < ActionController::Base
  private

  def after_sign_in_path_for(resource)
    params_origin = resource.class.name.underscore.to_sym
    params_origin.eql?(:company) ? edit_companies_path : edit_users_path
  end

  def first_sign_in?(current, path)
    (current.sign_in_count <= 1) ? redirect_to(path) : render('edit')
  end

end
