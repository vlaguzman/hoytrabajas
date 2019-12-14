class Users::Wizards::StepNinesController < Users::WizardsController

  def show
    new_educational_level = EducationalLevel.new(curriculum_vitae: current_user.curriculum_vitae)
    educational_level_presenter(new_educational_level)
  end

  def create
    add_associate_object(
      service:  Users::Wizards::StepNineService,
      klass: EducationalLevel,
      strong_params: step_nine_params,
      presenter: :educational_level_presenter,
      source_path: :users_wizards_step_nines_added_educational_level_path
    )
  end

  private

  def educational_level_presenter(educational_level)
    @educational_level = Users::Wizards::StepNinePresenter.new(educational_level)
  end

  def step_nine_params
    params
      .require(:educational_level)
      .permit(:degree, :institution_name, :start_date, :finish_date, :ongoing_study, :city_id, :diploma)
      .to_h
  end
end