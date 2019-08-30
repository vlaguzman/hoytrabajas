class CreateFunctionsOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :functions_offers do |t|
      t.references :offer, null: false, foreign_key: true
      t.references :function, null: false, foreign_key: true
    end
  end
end
