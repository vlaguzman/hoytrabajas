class AppliedOffersPresenter < ApplicationPresenter

  def mail_data
    offer_company = source.company
    user = options[:user]

    {
      offer_title:        capitalize_text(source.title),
      user_full_name:     full_name(user),
      company_name:       capitalize_text(offer_company.name),
      user_email:         user.email,
      company_email:      offer_company.email,
      operations_person:  ENV['OPERATIONS_PERSON'].to_s,
      user_path:          rails_routes.users_dashboard_url,
      #TODO: GABRIEL: Change company_path to user profile with this is ready
      company_path:       rails_routes.companies_dashboard_url
    }
  end

  private

  def capitalize_text(text)
    StringConverter.capitalize_text(text)
  end

  def full_name(user)
    full_name =  [user.name, user.last_name].join(' ')
    capitalize_text(full_name)
  end
end
