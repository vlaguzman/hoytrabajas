class RemoveSalaryTypes < ActiveRecord::Migration[6.0]
  def change
    drop_table :salary_types
  end
end
