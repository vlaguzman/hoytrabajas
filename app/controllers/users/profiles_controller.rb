class Users::ProfilesController < ApplicationController

  before_action :authenticate_user!

  def show
    #TODO oscar temporaily redirect to dashboard, uncomment when profile is ready
    #@user = UsersPresenter.new(current_user)
    #first_sign_in?(current_user, users_wizards_step_zero_path)

#   redirect_to users_dashboard_path
  end

end
