class AddSalaryTypeOfOfferSalaries < ActiveRecord::Migration[6.0]
  def change
    add_column :offer_salaries, :is_range, :boolean
  end
end
