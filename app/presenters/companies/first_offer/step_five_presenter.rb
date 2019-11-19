class Companies::FirstOffer::StepFivePresenter < ApplicationPresenter

  def form_information
    Companies::FirstOffer::StepFive::FormParamsService.new(
      source: source,
      errors: source.errors,
      action_path: companies_first_offer_step_five_path,
      previous_path: companies_first_offer_step_four_path,
      next_path: companies_first_offer_step_six_path,
      form_type: :offer,
      template_translation_path: "companies.first_offer.step_fives.show",
      form_method: :put
    ).form_params
      .merge({id: source.id})
  end

  private

  def companies_first_offer_step_five_path
    rails_routes.companies_first_offer_step_five_path
  end

  def companies_first_offer_step_four_path
    rails_routes.companies_first_offer_step_four_path(offer_id: source.id)
  end

  def companies_first_offer_step_six_path
    rails_routes.companies_first_offer_step_six_path(offer_id: source.id)
  end

end
