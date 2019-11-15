class RemoveSalaryTypes < ActiveRecord::Migration[6.0]
  def up
    drop_table :salary_types
  end

  def down
    create_table :salary_types do |t|
      t.string :description
      t.timestamps
    end
  end
end
