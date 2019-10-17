class Companies::FirstOffer::StepTwoPresenter < ApplicationPresenter

  def form_information
    Companies::FirstOffer::StepTwo::FormParamsService.new(
      action_path: companies_first_offer_step_two_path,
      next_path: companies_first_offer_step_three_path,
      previous_path: companies_first_offer_step_one_path,
      form_type: :company,
      template_translation_path: "companies.first_offer.step_twos.show",
      form_method: :put
    ).form_params
  end

  private

  def companies_first_offer_step_one_path
    rails_routes.companies_first_offer_step_one_path
  end

  def companies_first_offer_step_two_path
    rails_routes.companies_first_offer_step_two_path
  end

  def companies_first_offer_step_three_path
    rails_routes.companies_first_offer_step_three_path
  end
end
