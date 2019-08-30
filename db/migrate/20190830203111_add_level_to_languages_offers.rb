class AddLevelToLanguagesOffers < ActiveRecord::Migration[6.0]
  def change
    add_reference :languages_offers, :level, null: false, foreign_key: true
  end
end
