class ApplicationController < ActionController::Base
  helper MetaTagsVerifier

  around_action :set_locale_from_url

  protected

  def create_clientify_user(user, clientify_tag)
    if Rails.env.production?
      token = Clientify::ApiAuth.new().obtain_token 
      Clientify::DataManager.new(token).create_contact(user, clientify_tag)
    end
  end

  def update_clientify_user(user)
    if Rails.env.production?
      token = Clientify::ApiAuth.new().obtain_token 
      Clientify::DataManager.new(token).update_contact(user)
    end
  end

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
      redirect_to self.send("companies_first_offer_step_#{step}_path", offer_id: source[:data].id)
    else
      offer_presenter(source[:data])
      render 'show'
    end
  end

  def get_offer(params)
    if params[:offer_id].present?
      Offer.find(params[:offer_id])
    else
      redirect_to companies_first_offer_step_three_path
    end
  end

end
