class AddMostRecentToAppliedOfferTransition < ActiveRecord::Migration[6.0]
  def change
    add_column :applied_offer_transitions, :most_recent, :boolean, null: false
  end
end
