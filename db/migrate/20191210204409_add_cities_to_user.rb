class AddCitiesToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :residence_city_id, :integer
    add_index :users, :residence_city_id

    add_column :users, :born_city_id, :integer
    add_index :users, :born_city_id
  end
end
