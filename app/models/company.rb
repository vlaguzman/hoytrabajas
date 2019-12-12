class Company < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable, :confirmable,
          :lockable, :timeoutable, :trackable

  include Statesman::Adapters::ActiveRecordQueries[
    transition_class: CompanyTransition,
    initial_state: :no_premium
  ]

  validates_presence_of :email

  belongs_to :employees_range, optional: true
  belongs_to :city, optional: true

  has_many :offers
  has_many :company_transitions, autosave: false

  has_and_belongs_to_many :users

  has_one_attached :logo

  delegate :description, to: :employees_range, prefix: :employees_range, allow_nil: true

  def state_machine
    @state_machine ||= CompanyPremiumStateMachine.new(self, transition_class: CompanyTransition)
  end

  def after_confirmation
    self.update_attribute(:confirmed_at, DateTime.now)
  end
end
