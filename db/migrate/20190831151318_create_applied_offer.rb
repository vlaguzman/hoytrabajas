class CreateAppliedOffer < ActiveRecord::Migration[6.0]
  def change
    create_table :applied_offers do |t|
      t.datetime :applied_date
      t.string :note
      t.references :offer, null: false, foreign_key: true
      t.references :curriculum_vitae, null: false, foreign_key: true
      t.references :applied_offer_status, null: false, foreign_key: true

      t.timestamps
    end
  end
end
