class Users::ProfilesController < ApplicationController

  def show
    if user_signed_in? || company_signed_in?
      user = logged_candidate
      @user = Users::ProfilesPresenter.new(user)
    else
      redirect_to root_path
    end

  end

  def update
    parameter = update_permit_params[:user]
    if parameter.present?
      puts "$>"
      puts current_user.curriculum_vitae.photo.attached?
      puts "$>"
      AttachFile.upload_record_file(current_user.curriculum_vitae, :photo, parameter[:photo])
      redirect_to users_profile_path
      puts "&>"
      puts current_user.curriculum_vitae.photo.attached?
      puts "&>"
    else
      redirect_to users_profile_path
    end
  end

  private

  def show_permit_params
    params.permit(:user_id)
  end

  def update_permit_params
    params.permit(user: :photo)
  end

  def logged_candidate
    candidate_id = (user_signed_in?) ? current_user.id :  permit_params[:user_id]
    User.find_by(id: candidate_id)
  end
end
