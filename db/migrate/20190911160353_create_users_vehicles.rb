class CreateUsersVehicles < ActiveRecord::Migration[6.0]
  def change
    create_table :users_vehicles do |t|
      t.references :user, null: false, foreign_key: true
      t.references :vehicle, null: false, foreign_key: true
      t.timestamps
    end
  end
end
