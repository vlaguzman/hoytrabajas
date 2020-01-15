class Company < ApplicationRecord

  validates :name, :industry_id, :contact_cellphone, presence: true, allow_nil: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable, :confirmable,
          :lockable, :timeoutable, :trackable

  validates_presence_of :email

  belongs_to :employees_range, optional: true
  belongs_to :city, optional: true

  has_many :offers
  has_many :transitions, class_name: "CompanyTransition", autosave: false

  has_and_belongs_to_many :users

  has_one_attached :logo

  delegate :description, to: :employees_range, prefix: :employees_range, allow_nil: true

  delegate :can_transition_to?, :current_state, :history, :last_transition, :transition_to!, :transition_to, :in_state?, to: :state_machine

  def state_machine
    @state_machine ||= CompanyStateMachine.new(self, transition_class: CompanyTransition, association_name: :transitions)
  end

  def after_confirmation
    self.update_attribute(:confirmed_at, DateTime.now)
  end
end
