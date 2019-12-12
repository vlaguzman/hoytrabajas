class AddCountryToStates < ActiveRecord::Migration[6.0]
  def up
    add_reference :states, :country, foreign_key: true
  end

  def down
    remove_reference :states, :country, foreign_key: true
  end
end
