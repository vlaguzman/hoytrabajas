class CreateOfferTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :offer_types do |t|
      t.string :description
      t.timestamps
    end
  end
end
