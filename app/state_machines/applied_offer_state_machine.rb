class AppliedOfferStateMachine
  include Statesman::Machine

  state :unseen, initial: true
  state :seen
  state :interested
  state :not_interested

  transition from: :unseen,          to: :seen
  transition from: :seen,            to: [:interested, :not_interested]
  transition from: :interested,      to: [:not_interested]
  transition from: :not_interested,  to: [:interested]

end
