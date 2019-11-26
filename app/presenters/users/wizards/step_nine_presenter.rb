class Users::Wizards::StepNinePresenter < ApplicationPresenter

  def form_information
    Users::Wizards::StepNine::FormParamsService.new(
      errors: source.errors,
      template_translation_path: 'users.wizards.step_nines.show',
      action_path: users_wizards_step_nine_path,
      previous_path: users_wizards_step_eight_path,
      next_path: users_wizards_step_ten_path,
      form_method: :put
    ).form_params
  end

  def registered_studies
    educational_levels = source.curriculum_vitae.educational_levels
    educational_levels.map { |study| [study.degree] }
  end

  def have_studies?
    registered_studies.any?
  end

  def registered_studies_message
    count = registered_studies.count
    "Llevas #{count} registro(s) de informacion academica" if count > 0
  end

  private

  def users_wizards_step_nine_path
    rails_routes.users_wizards_step_nine_path
  end

  def users_wizards_step_eight_path
    rails_routes.users_wizards_step_eight_path
  end

  def users_wizards_step_ten_path
    rails_routes.users_wizards_step_ten_path
  end

end