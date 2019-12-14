class Companies::FirstOffer::StepTwoPresenter < Companies::FirstOfferPresenter

  def form_information
    Companies::FirstOffer::StepTwo::FormParamsService.new(
      service_params(
        action_path: companies_first_offer_step_two_path,
        next_path: new_companies_first_offer_step_three_path,
        previous_path: companies_first_offer_step_one_path,
        template_translation_path: "companies.first_offer.step_twos.show",
        form_type: :company
      )
    ).form_params
  end

  private

  def companies_first_offer_step_one_path
    rails_routes.companies_first_offer_step_one_path
  end

  def companies_first_offer_step_two_path
    rails_routes.companies_first_offer_step_two_path
  end

  def new_companies_first_offer_step_three_path
    rails_routes.companies_first_offer_step_three_path
  end
end
