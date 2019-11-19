class Companies::FirstOffer::StepEightPresenter < ApplicationPresenter

  def form_information
    Companies::FirstOffer::StepEight::FormParamsService.new(
      template_translation_path: "offers.first_offer.step_eights.show",
      go_home_path: root_path,
      next_path: companies_dashboard_path
    ).form_params
  end

  private

  def root_path
    rails_routes.root_path
  end

  def companies_dashboard_path
    rails_routes.companies_dashboard_path
  end
end
