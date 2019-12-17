class CompanyTransition < ApplicationRecord
  validates :to_state, inclusion: { in: CompanyStateMachine.states }
  belongs_to :company, inverse_of: :transitions
end
