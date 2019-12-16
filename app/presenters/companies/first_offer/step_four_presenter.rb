#TODO daniel, refactor this class
class Companies::FirstOffer::StepFourPresenter < Companies::FirstOfferPresenter

  def form_information
    Companies::FirstOffer::StepFour::FormParamsService.new(
      service_params(
        action_path: companies_first_offer_step_four_path,
        previous_path: companies_first_offer_step_three_path,
        next_path: companies_first_offer_step_five_path,
        template_translation_path: "companies.first_offer.step_fours.show",
      )
    ).form_params.merge({id: source.id})
  end

  private

  def companies_first_offer_step_four_path
    rails_routes.companies_first_offer_step_four_path
  end

  def companies_first_offer_step_three_path
    rails_routes.companies_first_offer_step_three_path(offer_id: source.id)
  end

  def companies_first_offer_step_five_path
    rails_routes.companies_first_offer_step_five_path(offer_id: source.id)
  end

end
