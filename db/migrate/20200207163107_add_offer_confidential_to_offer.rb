class AddOfferConfidentialToOffer < ActiveRecord::Migration[6.0]
  def change
    add_column :offers, :confidential, :boolean, null: true, default: false
  end
end
