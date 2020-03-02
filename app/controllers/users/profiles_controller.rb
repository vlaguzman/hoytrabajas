class Users::ProfilesController < ApplicationController

  def show
    if user_signed_in? || company_signed_in?
      user = visited_profile
      applied_offer_id = show_permit_params[:applied_offer_id] ? show_permit_params[:applied_offer_id] : 0
      @user = Users::ProfilesPresenter.new(user, applied_offer_id: applied_offer_id)
    else
      redirect_to root_path
    end
  end

  def update
    cv = current_user.curriculum_vitae
    Users::AttachFileService.upload_record_file(cv, :photo, update_permit_params[:photo])
    cv.user.errors.add(:curriculum_vitae_photo, cv.errors[:photo])
    @user = Users::ProfilesPresenter.new(cv.user)
    render 'show'
  end

  private

  def show_permit_params
    params.permit(:user_id, :applied_offer_id)
  end

  def update_permit_params
    params
    .require(:curriculum_vitae)
    .permit(:photo).to_h
  end

  def visited_profile
    profile_id = (user_signed_in?) ? current_user.id : show_permit_params[:user_id]
    User.find_by(id: profile_id)
  end

end