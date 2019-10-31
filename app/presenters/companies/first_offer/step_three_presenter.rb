class Companies::FirstOffer::StepThreePresenter < ApplicationPresenter

  def form_information
    Companies::FirstOffer::StepThree::FormParamsService.new(
      source: source,
      errors: source.errors,
      action_path: companies_first_offer_step_three_path,
      form_type: :offer,
      template_translation_path: "companies.first_offer.step_threes.show",
      form_method: :put
    ).form_params
      .merge({offer_id: source.id})
  end

  private

  def companies_first_offer_step_three_path
    rails_routes.companies_first_offer_step_three_path
  end

end
