class UsersController < ApplicationController

  before_action :authenticate_user!

  def edit
  end

  def update
  end

  def show
    first_sign_in?(current_user, user_path)
  end

end
