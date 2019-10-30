class Companies::FirstOffer::StepEightPresenter < ApplicationPresenter

  def form_information
    Companies::FirstOffer::StepEight::FormParamsService.new(
      template_translation_path: "companies.first_offer.step_threes.new",
      go_home_path: root_path,
      next_path: company_path
    ).form_params
  end

  private

  def root_path
    rails_routes.root_path
  end

  def company_path
    rails_routes.company_path(source)
  end
end
