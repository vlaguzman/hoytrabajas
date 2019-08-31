class CreateEducationalLevelsOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :educational_levels_offers do |t|
      t.references :educational_level, null: false, foreign_key: true
      t.references :offer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
