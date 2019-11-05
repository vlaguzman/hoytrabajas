class UsersController < ApplicationController

  before_action :authenticate_user!

  def edit
  end

  def show
    redirect_to users_dashboard_path
  end

end
