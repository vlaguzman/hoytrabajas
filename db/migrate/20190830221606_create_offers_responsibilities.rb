class CreateOffersResponsibilities < ActiveRecord::Migration[6.0]
  def change
    create_table :offers_responsibilities do |t|
      t.references :offer, null: false, foreign_key: true
      t.references :responsibility, null: false, foreign_key: true

      t.timestamps
    end
  end
end
