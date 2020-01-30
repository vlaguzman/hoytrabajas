class Users::Wizards::StepNines::ChoicesPresenter < ApplicationPresenter

  def initialize(current_user)
    @current_user = current_user
  end

  def return_path
    has_work_experience ? rails_routes.users_wizards_step_eight_path : rails_routes.users_wizards_step_six_path
  end

  def current_path
    rails_routes.users_wizards_step_nine_path
  end

  def skip_path
    rails_routes.users_wizards_step_eleven_path
  end

  def curriculum_vitae_id
    CurriculumVitae.find_by(user_id: @current_user.id).id
  end

  def has_work_experience
    WorkExperience.exists?(curriculum_vitae_id: curriculum_vitae_id)
  end
end