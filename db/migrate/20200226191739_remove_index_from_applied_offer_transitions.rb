class RemoveIndexFromAppliedOfferTransitions < ActiveRecord::Migration[6.0]
  def change
    remove_reference :applied_offer_transitions, :offer
    remove_reference :applied_offer_transitions, :curriculum_vitae
  end
end
