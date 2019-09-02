class CreateOffersVehicles < ActiveRecord::Migration[6.0]
  def change
    create_table :offers_vehicles do |t|
      t.references :offer, null: false, foreign_key: true
      t.references :vehicle, null: false, foreign_key: true

      t.timestamps
    end
  end
end
