class Companies::FirstOffer::StepOnePresenter < ApplicationPresenter

  def form_information
    Companies::FirstOffer::StepOne::FormParamsService.new(
      source: source,
      errors: source.errors,
      action_path: companies_first_offer_step_one_path,
      next_path: companies_first_offer_step_two_path,
      previous_path: companies_first_offer_step_zero_path,
      form_type: :company,
      template_translation_path: "companies.first_offer.step_ones.show",
      form_method: :put
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
