class Users::Wizards::StepSixesController < ApplicationController
  before_action :authenticate_user!

  def show
    user_presenter
  end

  def create
    curriculum_vitae = current_user.curriculum_vitae
    updated_curriculum = Users::Wizards::StepSixService.(curriculum_vitae: curriculum_vitae, update_params: step_six_params)

    if updated_curriculum.errors.details.any?
      user_presenter
      render 'show'
    else
      redirect_to users_wizards_step_seven_path
    end
  end

  private

  def user_presenter(user: current_user)
    @user = Users::Wizards::StepSixPresenter.new(user)
  end

  def step_six_params
    params
    .require(:curriculum_vitae)
    .permit(
        soft_skill_ids: [],
        curriculum_vitaes_technical_skills:[
          :job_category_id,
          :technical_skill_id,
          :level_id
        ],
        to_learn_skills:[
          :job_category_id,
          :technical_skill_id
        ],
        curriculum_vitaes_languages:[
          :language_id,
          :level_id
        ]
    ).to_h
  end

end
