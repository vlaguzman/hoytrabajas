class Users::Wizards::StepThreesController < ApplicationController
  before_action :authenticate_user!

  def show
    user_presenter
  end

  def update
    updated_curriculum = Users::Wizards::StepThreeService.(curriculum_vitae: current_user.curriculum_vitae, update_params: step_three_params)

    if updated_curriculum.errors.details.any?
      user_presenter(updated_curriculum.user)
      render :show
    else
      redirect_to users_wizards_step_four_path
    end
  end

  private

  def user_presenter(user= current_user)
    @user = Users::Wizards::StepThreePresenter.new(user)
  end

  def step_three_params
    params
    .require(:curriculum_vitae)
    .permit(
      :contract_type_id,
      :labor_disponibility_id,
      job_category_ids: [],
      offer_type_ids:[],
      work_mode_ids:[]
    ).to_h
  end

end
