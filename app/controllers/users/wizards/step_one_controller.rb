class Users::Wizards::StepOneController < ApplicationController

  def show
    @user = Users::Wizards::StepOnePresenter.new(current_user)
  end

  def update
    @user = Users::Wizards::StepOneService.(candidate: current_user, update_params: strong_params)

    @user = Users::Wizards::StepOnePresenter.new(current_user)

    if not @user.errors.details.present?
      redirect_to users_step_two_path
    else
      render 'show'
    end
  end

  private

  def strong_params
    params.require(:user).permit(:name, :last_name, :document_type_id, :contact_number, :identification_number, nationality_ids: []).to_h
  end

end
