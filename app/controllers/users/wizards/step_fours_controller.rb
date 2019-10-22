class Users::Wizards::StepFoursController < ApplicationController
  before_action :authenticate_user!

  attr_reader :user

  def show
    user_presenters
  end

  def update
    user = Users::Wizards::StepFourService.(candidate: current_user, update_params: strong_params)

    if user.errors.details.any?
      user_presenters
      render 'show'
    else
      redirect_to users_wizards_step_five_path
    end
  end

  private

  def user_presenters
    @user = Users::Wizards::StepFourPresenter.new(current_user)
  end

  def strong_params
    params
    .require(:user)
    .permit(:city_id, { driving_licence_ids:[], vehicle_ids: [], curriculum_vitae: [:travel_disponibility] })
    .to_h
  end

end
