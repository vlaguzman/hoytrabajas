class Users::Wizards::StepSevensController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = Users::Wizards::StepSevenPresenter.new(current_user)
  end

end
