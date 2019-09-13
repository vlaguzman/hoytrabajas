class Users::Wizards::StepThreePresenter < ApplicationPresenter

  def job_categories_list
    JobCategory.all.map { |object| [object.description, object.id] }
  end

  def offer_types_list
    OfferType.all.map { |object| [object.description, object.id] }
  end

  def contract_types_list
    ContractType.all.map { |object| [object.description, object.id] }
  end

  def work_modes_list
    WorkMode.all.map { |object| [object.description, object.id] }
  end

  def labor_disponibilities_list
    LaborDisponibility.all.map { |object| [object.description, object.id] }
  end

end