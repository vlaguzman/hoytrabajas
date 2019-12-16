class Companies::FirstOffer::StepOnePresenter < Companies::FirstOfferPresenter

  def form_information
    Companies::FirstOffer::StepOne::FormParamsService.new(
      service_params(
        action_path: companies_first_offer_step_one_path,
        next_path: companies_first_offer_step_two_path,
        previous_path: companies_first_offer_step_zero_path,
        template_translation_path: "companies.first_offer.step_ones.show",
        form_type: :company,
      )
    ).form_params
  end

  private

  def companies_first_offer_step_zero_path
    rails_routes.companies_first_offer_step_zero_path
  end

  def companies_first_offer_step_one_path
    rails_routes.companies_first_offer_step_one_path
  end

  def companies_first_offer_step_two_path
    rails_routes.companies_first_offer_step_two_path
  end

end
