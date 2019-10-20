class Companies::FirstOffer::StepThreePresenter < ApplicationPresenter

  def form_information
    Companies::FirstOffer::StepThree::FormParamsService.new(
      action_path: companies_first_offer_step_three_path,
      previous_path: companies_first_offer_step_two_path,
      next_path: '',
      form_type: :offer,
      template_translation_path: "companies.first_offer.step_threes.new",
      form_method: :post
    ).form_params
  end

  private

  def companies_first_offer_step_two_path
    rails_routes.companies_first_offer_step_two_path
  end

  def companies_first_offer_step_three_path
    rails_routes.companies_first_offer_step_three_path
  end

end
