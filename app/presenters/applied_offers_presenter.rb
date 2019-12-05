class AppliedOffersPresenter < ApplicationPresenter

  def mail_data
    offer_company = source.company
    user = options[:user]

    {
      offer_title:        capitalize_text(source.title),
      user_name:          capitalize_text(user.name),
      user_last_name:     capitalize_text(user.last_name),
      company_name:       capitalize_text(offer_company.name),
      user_email:         user.email,
      company_email:      offer_company.email
    }
  end

  private

  def capitalize_text(text)
    StringConverter.capitalize_text(text)
  end

end
