class AddSalaryTypeOfOfferSalaries < ActiveRecord::Migration[6.0]
  def up
    add_column :offer_salaries, :is_range, :boolean
  end

  def down
    remove_column :offer_salaries, :is_range
  end
end
