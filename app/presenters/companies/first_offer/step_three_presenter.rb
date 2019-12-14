class Companies::FirstOffer::StepThreePresenter < Companies::FirstOfferPresenter

  def form_information
    Companies::FirstOffer::StepThree::FormParamsService.new(
      service_params(
        action_path: companies_first_offer_step_three_path,
        template_translation_path: "companies.first_offer.step_threes.show",
      )
    ).form_params.merge({offer_id: source.id})
  end

  private

  def companies_first_offer_step_three_path
    rails_routes.companies_first_offer_step_three_path
  end

end
