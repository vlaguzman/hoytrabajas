class ApplicationController < ActionController::Base
  private

  def after_sign_in_path_for(resource)
    params_origin = resource.class.name.underscore.to_sym
    params_origin.eql?(:company) ? companies_dashboard_path : users_dashboard_path
  end

  def first_sign_in?(current, path, render='show')
    (current.sign_in_count <= 1) ? redirect_to(path) : render(render)
  end

  def raise_login_count(current)
    current.sign_in_count += 1
    current.save
  end

  def redirect_to_offer_step(step, source)
    if source[:status].eql?(:ok)
      redirect_to self.send("companies_first_offer_step_#{step}_path")
    else
      offer_presenter(source[:data])
      render 'show'
    end
  end

end
