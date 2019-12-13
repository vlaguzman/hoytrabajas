class CompanyStateMachine
  include Statesman::Machine

  state :no_premium, initial: true
  state :premium

  transition from: :no_premium, to: :premium
  transition from: :premium, to: :no_premium

  after_transition(to: :premium) do |company, transition|
    CompanyService.up_offers_on_demands(company)
  end
end
