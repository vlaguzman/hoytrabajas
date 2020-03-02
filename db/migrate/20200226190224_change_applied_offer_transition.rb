class ChangeAppliedOfferTransition < ActiveRecord::Migration[6.0]
  def up
    add_column :applied_offer_transitions, :applied_offer_id, :integer, null: false
    add_foreign_key :applied_offer_transitions, :applied_offers
  end

  def down
    remove_column :applied_offer_transitions, :offer_id
    remove_column :applied_offer_transitions, :curriculum_vitae_id
  end
end
