class Users::Wizards::StepEightPresenter < ApplicationPresenter

  def form_information
    Users::Wizards::StepEight::FormParamsService.new(
      errors: source.errors,
      template_translation_path: 'users.wizards.step_eights.show',
      action_path: users_wizards_step_eight_path,
      previous_path: users_wizards_step_six_path,
      next_path: users_wizards_step_nine_path,
      form_method: :put
    ).form_params
  end

  def registered_experience
    cv = source.curriculum_vitaes.first.id
    WorkExperience.where(curriculum_vitae_id: cv).map { |exp| [exp.company_name, exp.work_position.description] }
  end

  def have_experience?
    registered_experience.any?
  end

  def registered_experience_message
    count = registered_experience.count
    if count >= 1
      "Llevas #{count} registro(s) de experiencia laboral"
    end
  end

  private

  def users_wizards_step_nine_path
    rails_routes.users_wizards_step_nine_path
  end

  def users_wizards_step_six_path
    rails_routes.users_wizards_step_six_path
  end

  def users_wizards_step_eight_path
    rails_routes.users_wizards_step_eight_path
  end
end