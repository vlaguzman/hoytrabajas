class AppliedOffer < ApplicationRecord
  validates_presence_of :applied_date, :offer_id, :curriculum_vitae_id, :applied_offer_status_id

  belongs_to :offer
  belongs_to :curriculum_vitae
  belongs_to :applied_offer_status

  has_many :transitions, class_name: "AppliedOfferTransition", autosave: false

  delegate :can_transition_to?, :current_state, :history, :last_transition, :transition_to!, :transition_to, :in_state?, to: :state_machine

  include Statesman::Adapters::ActiveRecordQueries[
    transition_class: AppliedOfferTransition,
    initial_state: AppliedOfferStateMachine.initial_state,
    transition_name: :transitions
  ]

  def state_machine
    @state_machine ||= AppliedOfferStateMachine.new(self, transition_class: AppliedOfferTransition, association_name: :transitions)
  end

  delegate :title, to: :offer, prefix: :offer, allow_nil: true

  scope :order_by_applied_date, -> { order(applied_date: :asc) }

  validates_uniqueness_of :curriculum_vitae_id, :scope => :offer_id
end
