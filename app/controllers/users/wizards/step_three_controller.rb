class Users::Wizards::StepThreeController < ApplicationController

  def show
    @user = user_presenter(current_user)
  end

  def update
    @user = Users::Wizards::StepThreeService.(candidate: current_user, update_params: strong_params)

    if @user.errors.details.any?
      @user = user_presenter(current_user)
      render 'show'
    else
      redirect_to users_step_four_path
    end
  end

  private

  def user_presenter(user)
    Users::Wizards::StepThreePresenter.new(user)
  end

  def strong_params
    params
    .require(:user)
    .permit(curriculum_vitae: [
          :contract_type_id,
          :labor_disponibility_id,
          job_category_ids: [],
          offer_type_ids:[],
          work_mode_ids:[]
    ])
    .to_h
  end

end
