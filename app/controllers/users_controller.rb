class UsersController < ApplicationController

  def edit
    if current_user.sign_in_count <= 1
      redirect_to users_wizards_step_one_path
    else
      render 'edit'
    end
  end

  def update
  end

end