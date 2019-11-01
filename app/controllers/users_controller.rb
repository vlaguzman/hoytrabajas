class UsersController < ApplicationController

  before_action :authenticate_user!

  def edit
  end

  def update
  end

  def show
    @user = UsersPresenter.new(current_user)
    first_sign_in?(current_user, users_wizards_step_zero_path)
  end

end
