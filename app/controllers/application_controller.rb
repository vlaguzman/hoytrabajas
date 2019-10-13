class ApplicationController < ActionController::Base
  private

  def after_sign_in_path_for(resource)
    params_origin = resource.class.name.underscore.to_sym
    params_origin.eql?(:company) ? companies_path(resource) : user_path(resource)
  end

  def first_sign_in?(current, path)
    (current.sign_in_count <= 1) ? redirect_to(path) : render('show')
  end

  def after_sign_out_path_for(resource)
    puts("estoy cerrando la vueta"*100)
    root_path
  end
end
