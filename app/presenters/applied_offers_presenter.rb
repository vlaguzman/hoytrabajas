class AppliedOffersPresenter < ApplicationPresenter

  def mail_data
    offer_company = source.company
    user = options[:user]

    {
      offer_title:        capitalize_text(source.title),
      user_full_name:     full_name(user),
      company_name:       capitalize_text(offer_company.name),
      user_email:         user.email,
      company_email:      offer_company.email
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
