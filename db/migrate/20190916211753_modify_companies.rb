class ModifyCompanies < ActiveRecord::Migration[6.0]
  def self.up
    remove_column :companies, :employees_range_id
    add_reference :companies, :employees_ranges, foreign_key: true
  end

  def self.down
    add_reference :companies, :employees_ranges, foreign_key: true, null: false
  end
end
