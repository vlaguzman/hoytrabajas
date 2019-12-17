class CreateOfferOnDemand < ActiveRecord::Migration[6.0]
  def change
    create_table :offer_on_demands do |t|
      t.string :status
      t.date :start_at
      t.date :finish_at
      t.references :offer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
