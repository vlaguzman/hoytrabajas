class Users::Wizards::StepElevenPresenter < ApplicationPresenter

  def form_information
    Users::Wizards::StepEleven::FormParamsService.new(
      template_translation_path: 'users.wizards.step_elevens.show',
      go_home_path: root_path,
      next_path: user_path,
    ).form_params
  end

  private

  def root_path
    rails_routes.root_path
  end

  def user_path
    rails_routes.user_path(source)
  end
end