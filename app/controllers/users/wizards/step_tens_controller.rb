class Users::Wizards::StepTensController < Users::WizardsController

  def show
    new_acknowledgment = Acknowledgment.new(curriculum_vitae: current_user.curriculum_vitae)
    acknowledgment_presenter(new_acknowledgment)
  end

  def create
    add_associate_object(
      service: Users::Wizards::StepTenService,
      klass: Acknowledgment,
      strong_params: step_ten_params,
      presenter: :acknowledgment_presenter,
      source_path: :users_wizards_step_tens_added_acknowledgment_path
    )
  end

  private

  def acknowledgment_presenter(acknowledgment)
    @acknowledgment = Users::Wizards::StepTenPresenter.new(acknowledgment)
  end

  def step_ten_params
    params
    .require(:acknowledgment)
    .permit(
      :title,
      :start_date,
      :entity_name,
      :diploma,
      :city_id
    ).to_h
  end

end