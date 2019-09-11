class Users::Wizards::StepThreeController < ApplicationController

  def show
    @user = Users::Wizards::StepThreePresenter.new(current_user)
  end

  def update
    puts params

    @user = Users::Wizards::StepThreeService.(candidate: current_user, update_params: strong_params)


    #if not @user.errors.details.present?
    #  redirect_to users_step_two_path
    #else
    #  render 'show'
    #end
  end

  private

  def strong_params
    params.require(:form).permit(
      :job_cateogories,
      :offer_types,
      :contract_type,
      :work_modes,
      :labor_disponibilities
      ).to_h
  end

end
