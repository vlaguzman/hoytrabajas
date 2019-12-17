class Users::WizardsController < ApplicationController
  before_action :authenticate_user!

  private

  def validate_redirect_to(
    source: current_user,
    users_wizard_path: users_wizards_step_zero_path,
    view: :show,
    other_validation: false
  )
    if source.errors.present? || other_validation
      render view
    else
      redirect_to users_wizard_path
    end
  end

  def add_associate_object(
    service: _,
    klass: _,
    strong_params: {},
    presenter: _,
    source_path: _
  )

    added_associate_object, updated = service.(
      source: klass.new(curriculum_vitae: current_user.curriculum_vitae),
      update_params: strong_params
    )

    self.send(presenter, added_associate_object)

    path = updated ? self.send(source_path, added_associate_object) : root_path

    validate_redirect_to(
      source: added_associate_object,
      users_wizard_path: path
    )
  end

end