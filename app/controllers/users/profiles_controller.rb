class Users::ProfilesController < ApplicationController

  before_action :authenticate_user!

  def show
     user = User.find(permit_params[:user_id])
     @user = UsersPresenter.new(user)
  end

  private

  def permit_params
    params.permit(:user_id)
  end

end
