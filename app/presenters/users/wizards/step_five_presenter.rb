class Users::Wizards::StepFivePresenter < ApplicationPresenter

  def available_work_days_list
    AvailableWorkDay.all.map { |object| [object.description, object.id] }
  end

  def working_days_list
    WorkingDay.all.map { |object| [object.description, object.id] }
  end

  def range_types_list
    [["Rango", 1], ["Fijo", 2]]
  end

  def currencies_list
    Currency.all.map { |object| [object.description, object.id] }
  end

  def salary_periods_list
    SalaryPeriod.all.map { |object| [object.description, object.id] }
  end

end