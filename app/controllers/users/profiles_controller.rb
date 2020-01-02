class Users::ProfilesController < ApplicationController

  def show
    if user_signed_in? || company_signed_in?
      user = User.find(permit_params[:user_id])
      @user = Users::ProfilesPresenter.new(user)
    else
      redirect_to root_path
    end
  end

  private

  def permit_params
    params.permit(:user_id)
  end

end
