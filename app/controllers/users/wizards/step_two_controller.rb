class Users::Wizards::StepTwoController < ApplicationController

  def show
    @user = user_presenters(current_user)
  end

  def update
    @user = Users::Wizards::StepTwoService.(candidate: current_user, update_params: strong_params)

    if @user.errors.details.any?
      @user = user_presenters(current_user)
      render 'show'
    else
      redirect_to users_step_three_path
    end
  end

  private

  def user_presenters(user)
    Users::Wizards::StepTwoPresenter.new(user)
  end

  def strong_params
    params.require(:user).permit(:about_me, :sex_id, :birthday, :educational_degree_id, {limitation_ids: []} ).to_h
  end

end