class Users::WizardsController < ApplicationController
  before_action :authenticate_user!

  private

  def validate_redirect_to(source: current_user, users_wizard_path: users_wizards_step_zero_path, view: :show)
    if not source.errors.present?
      redirect_to users_wizard_path
    else
      render view
    end
  end

  def build_associate_object(klass)
    new_work_experience = klass.new(curriculum_vitae: current_user.curriculum_vitae)
  end
end