class CompanyTransition < ActiveRecord::Base
  include Statesman::Adapters::ActiveRecordTransition

  validates :to_state, inclusion: { in: CompanyPremiumStateMachine.states }

  belongs_to :company, inverse_of: :company_transitions
end
