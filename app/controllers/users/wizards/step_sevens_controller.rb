class Users::Wizards::StepSevensController < ApplicationController

  def show
    user_presenter
  end

  def update
    user = Users::Wizards::StepSevenService.(candidate: current_user, update_params: strong_params)

    if user.errors.details.any?
      user_presenter(user: user)
      render 'show'
    else
      redirect_to users_wizards_step_eight_path
    end
  end

  private

  def user_presenter(user: current_user)
    @user = Users::Wizards::StepSevenPresenter.new(user)
  end

  def strong_params
    params
    .require(:user)
    .permit(
=begin       curriculum_vitae:{
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
      }
=end
    ).to_h
  end

end
