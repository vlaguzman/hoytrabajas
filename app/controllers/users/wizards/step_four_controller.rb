class Users::Wizards::StepFourController < ApplicationController

  def show
    @user = user_presenter(current_user)
  end

  def update
    @user = Users::Wizards::StepFourService.(candidate: current_user, update_params: strong_params)


    if @user.errors.details.any?
      @user = user_presenter(current_user)
      render 'show'
    else
      redirect_to users_step_five_path
    end
  end

  private

  def user_presenter(user)
    Users::Wizards::StepFourPresenter.new(user)
  end

  def strong_params
    params
    .require(:user)
    .permit(:city_id, { driving_licence_ids:[], vehicle_ids: [], curriculum_vitae: [:travel_disponibility] })
    .to_h
  end

end
