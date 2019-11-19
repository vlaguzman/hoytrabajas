class Companies::FirstOffer::StepSix::FormParamsService < BaseFormWizardsService

  MULTIPLE_SELECT_FIELDS_KEYS = [
    :responsibility_ids,
    :requirement_ids,
    :vehicle_ids,
    :driving_licence_ids
  ]

  private

  def responsibility_ids_list
    ListConverter.model_list Responsibility
  end

  def requirement_ids_list
    ListConverter.model_list Requirement
  end

  def vehicle_ids_list
    ListConverter.model_list Vehicle
  end

  def driving_licence_ids_list
    ListConverter.model_list DrivingLicence
  end
end
