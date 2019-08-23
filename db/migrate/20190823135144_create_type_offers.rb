class CreateTypeOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :type_offers do |t|
      t.string :description
      t.timestamps
    end
  end
end
