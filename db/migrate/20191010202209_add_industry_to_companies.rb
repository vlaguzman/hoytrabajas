class AddIndustryToCompanies < ActiveRecord::Migration[6.0]
  def up
    add_reference :companies, :industry, foreign_key: true
  end

  def down
    remove_reference :companies, :industry, foreign_key: true
  end
end
