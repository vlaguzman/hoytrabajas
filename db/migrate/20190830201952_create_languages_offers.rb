class CreateLanguagesOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :languages_offers do |t|
      t.references :language, null: false, foreign_key: true
      t.references :offer, null: false, foreign_key: true

      t.timestamps
    end
  end
end