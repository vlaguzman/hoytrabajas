class Users::Wizards::StepTenPresenter < ApplicationPresenter

  def form_information
    Users::Wizards::StepTen::FormParamsService.new(
      template_translation_path: 'users.wizards.step_tens.show',
      action_path: users_wizards_step_ten_path,
      previous_path: users_wizards_step_nine_path,
      next_path: users_wizards_step_eleven_path,
      form_method: :put
    ).form_params
  end

  def registered_acknowledgments
    cv_id = source.curriculum_vitae.id
    Acknowledgment.where(curriculum_vitae_id: cv_id).map { |act| [act.title] }
  end

  def have_acknowledgments?
    registered_acknowledgments.any?
  end

  def registered_acknowledgments_message
    count = registered_acknowledgments.count
    if count >= 1
      "Llevas #{count} registro(s) de reconocimientos"
    end
  end

  private

  def users_wizards_step_nine_path
    rails_routes.users_wizards_step_nine_path
  end

  def users_wizards_step_ten_path
    rails_routes.users_wizards_step_ten_path
  end

  def users_wizards_step_eleven_path
    rails_routes.users_wizards_step_eleven_path
  end
end