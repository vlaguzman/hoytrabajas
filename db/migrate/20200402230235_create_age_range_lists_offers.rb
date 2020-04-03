class CreateAgeRangeListsOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :age_range_lists_offers do |t|
      t.references :offer, null: false, foreign_key: true
      t.references :age_range_list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
