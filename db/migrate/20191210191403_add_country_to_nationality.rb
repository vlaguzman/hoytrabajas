class AddCountryToNationality < ActiveRecord::Migration[6.0]
  def up
    add_reference :nationalities, :country, foreign_key: true
  end

  def down
    remove_reference :nationalities, :country, foreign_key: true
  end
end
