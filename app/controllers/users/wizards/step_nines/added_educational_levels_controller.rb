class Users::Wizards::StepNines::AddedEducationalLevelsController < ApplicationController

  def show
    educational_level_presenter(
      EducationalLevel.find_by(id: educational_level_id)
    )
  end

  private

  def educational_level_presenter(educational_level)
    @educational_level = Users::Wizards::StepNines::EducationalLevelPresenter.new(educational_level, user: current_user, cookies_path: cookies[:applied_offer_path])
  end

  def educational_level_id
    params.permit(:id).to_h[:id]
  end
end
