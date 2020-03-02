class AppliedOfferTransition < ApplicationRecord
  validates :to_state, inclusion: { in: AppliedOfferStateMachine.states }
  belongs_to :applied_offer, inverse_of: :transitions
end
