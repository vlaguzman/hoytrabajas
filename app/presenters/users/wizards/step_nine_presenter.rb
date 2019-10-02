class Users::Wizards::StepNinePresenter < ApplicationPresenter
  def cities_list
    model_list(City)
  end

  def registered_studies
    cv_id = source.curriculum_vitaes.first.id
    EducationalLevel.where(curriculum_vitae_id: cv_id).map { |study| [study.degree] }
  end

  def have_studies?
    registered_studies.any?
  end

  def registered_studies_message
    count = registered_studies.count
    if count >= 1
      "Llevas #{count} registro(s) de informacion academica"
    end
  end
end