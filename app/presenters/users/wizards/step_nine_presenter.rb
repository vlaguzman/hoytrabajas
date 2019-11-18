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
    cv_id = source.curriculum_vitae.id
    EducationalLevel.where(curriculum_vitae_id: cv_id).map { |study| [study.degree] }
  end

  def have_studies?
    registered_studies.any?
  end

  def registered_studies_message
    count = registered_studies.count
    if count >= 1
      "Llevas #{count} registro(s) de informacion academica"
    end
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