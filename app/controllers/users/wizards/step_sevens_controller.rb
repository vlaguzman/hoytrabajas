class Users::Wizards::StepSevensController < ApplicationController

  def show
    @user = Users::Wizards::StepSevenPresenter.new(current_user)
  end

end
