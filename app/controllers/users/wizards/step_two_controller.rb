class Users::Wizards::StepTwoController < ApplicationController

  def show
    @user = Users::Wizards::StepTwoPresenter.new(current_user)
  end

  def update
    @user = Users::Wizards::StepTwoService.(candidate: current_user, update_params: strong_params)
    #TODO Ajustar el uso de @user
    @user = Users::Wizards::StepTwoPresenter.new(current_user)

    if not @user.errors.details.present?
      render 'users/wizards/step_three/show'
    else
      render 'show'
    end
  end

  private

  def strong_params
    params.require(:user).permit(:about_me, :sex_id, :birthday, :educational_degree_id, {limitation_ids: []} ).to_h
  end

end