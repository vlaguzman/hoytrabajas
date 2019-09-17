class UsersController < ApplicationController

  def edit
    first_sign_in?(current_user, users_wizards_step_zero_path)
  end

  def update
  end

end