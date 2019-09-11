class Users::Wizards::StepThreePresenter < ApplicationPresenter

  def job_categories_list
    JobCategory.all
  end

  def offer_types_list
    OfferType.all
  end

  def contract_types_list
    ContractType.all
  end

  def work_modes_list
    WorkMode.all
  end

  def labor_disponibilities_list
    LaborDisponibility.all
  end

end