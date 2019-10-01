class UsersController < ApplicationController

  before_action :authenticate_user!

  def edit
    first_sign_in?(current_user, users_wizards_step_zero_path)
  end

  def update
  end

  def show
  end

end
