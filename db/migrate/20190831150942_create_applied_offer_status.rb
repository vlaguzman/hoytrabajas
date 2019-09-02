class CreateAppliedOfferStatus < ActiveRecord::Migration[6.0]
  def change
    create_table :applied_offer_statuses do |t|
      t.string :description

      t.timestamps
    end
  end
end
