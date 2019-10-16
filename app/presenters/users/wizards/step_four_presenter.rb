class Users::Wizards::StepFourPresenter < ApplicationPresenter

  def states_list
    State.all.map { |object| [object.description, object.id] }
  end

  def cities_list
    City.all.map { |object| [object.description, object.id] }
  end

  def vehicles_list
    Vehicle.all.map { |object| [object.description, object.id] }
  end

  def driving_licences_list
    DrivingLicence.all.map { |object| [object.description, object.id] }
  end

  def work_modes_list
    WorkMode.all.map { |object| [object.description, object.id] }
  end
end
