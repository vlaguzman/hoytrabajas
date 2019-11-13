class RemoveSalaryTypeOfOfferSalaries < ActiveRecord::Migration[6.0]
  def change
    remove_reference :offer_salaries, :salary_type
  end
end
