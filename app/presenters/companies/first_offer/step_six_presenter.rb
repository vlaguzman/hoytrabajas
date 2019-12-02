#TODO daniel, refactor this class
class Companies::FirstOffer::StepSixPresenter < ApplicationPresenter

  def form_information
    Companies::FirstOffer::StepSix::FormParamsService.new(
      source: source,
      errors: source.errors,
      action_path: companies_first_offer_step_six_path,
      previous_path: companies_first_offer_step_five_path,
      next_path: companies_first_offer_step_seven_path,
      form_type: :offer,
      template_translation_path: "companies.first_offer.step_sixes.show",
      form_method: :put
    ).form_params
      .merge({id: source.id})
  end

  private

  def companies_first_offer_step_six_path
    rails_routes.companies_first_offer_step_six_path
  end

  def companies_first_offer_step_five_path
    rails_routes.companies_first_offer_step_five_path(offer_id: source.id)
  end

  def companies_first_offer_step_seven_path
    rails_routes.companies_first_offer_step_seven_path(offer_id: source.id)
  end

end
