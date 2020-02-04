class Users::Wizards::StepSevensController < ApplicationController
  before_action :authenticate_user!

  def show
    @choices = Users::Wizards::StepSevenPresenter.new(current_user)
  end

  def update
    redirect_to users_wizards_step_eight_path
  end

end
