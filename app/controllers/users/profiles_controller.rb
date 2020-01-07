class Users::ProfilesController < ApplicationController

  def show
    if user_signed_in? || company_signed_in?
      user = logged_candidate
      @user = Users::ProfilesPresenter.new(user)
    else
      redirect_to root_path
    end
  end

  private

  def permit_params
    params.permit(:user_id)
  end

  def logged_candidate
    candidate_id = (user_signed_in?) ? current_user.id :  permit_params[:user_id]
    User.find_by(id: candidate_id)
  end

end
