class UsersController < ApplicationController

  before_action :authenticate_user!

  def edit
  end

  def update
  end

  def show
    first_sign_in?(current_user, users_wizards_step_zero_path)
  end

end
