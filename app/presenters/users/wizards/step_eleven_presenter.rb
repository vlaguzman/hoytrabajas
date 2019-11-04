class Users::Wizards::StepElevenPresenter < ApplicationPresenter

  def form_information
    Users::Wizards::StepEleven::FormParamsService.new(
      template_translation_path: 'users.wizards.step_elevens.show',
      go_home_path: root_path,
      next_path: users_dashboard_path,
    ).form_params
  end

  private

  def root_path
    rails_routes.root_path
  end

  def users_dashboard_path
    rails_routes.users_dashboard_path(source)
  end
end