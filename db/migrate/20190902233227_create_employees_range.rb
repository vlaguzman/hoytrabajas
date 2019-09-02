class CreateEmployeesRange < ActiveRecord::Migration[6.0]
  def change
    create_table :employees_ranges do |t|
      t.string :description

      t.timestamps
    end
  end
end
