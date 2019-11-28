class AddStateToCities < ActiveRecord::Migration[6.0]
  def up 
    add_reference :cities, :state, foreign_key: true
  end

  def down
    remove_reference :cities, :state, foreign_key: true
  end
end
