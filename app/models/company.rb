class Company < ApplicationRecord

  DEFAULT_MAX_SIZE_IMAGE = 2000000

  validates :name, :contact_cellphone, :description, presence: true, allow_nil: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable, :confirmable,
          :lockable, :timeoutable, :trackable

  validates_presence_of :email

  belongs_to :employees_range, optional: true
  belongs_to :city, optional: true
  belongs_to :industry, optional: true

  has_many :offers
  has_many :transitions, class_name: "CompanyTransition", autosave: false

  has_and_belongs_to_many :users

  has_one_attached :logo

  delegate :description, to: :employees_range, prefix: :employees_range, allow_nil: true
  delegate :description, :state_description, to: :city, prefix: :city, allow_nil: true

  delegate :can_transition_to?, :current_state, :history, :last_transition, :transition_to!, :transition_to, :in_state?, to: :state_machine

  validate :validate_logo

  def validate_logo
    if logo.attached?
      if !logo.blob.content_type.starts_with?('image/')
        self.reload.logo.purge
        errors.add(:logo, I18n.t('activerecord.errors.models.company.attributes.logo.invalid_format'))
      elsif logo.blob.byte_size > DEFAULT_MAX_SIZE_IMAGE
        self.reload.logo.purge
        errors.add(:logo, I18n.t('activerecord.errors.models.company.attributes.logo.greather_that_two_mb'))
      end
    end
  end

  def state_machine
    @state_machine ||= CompanyStateMachine.new(self, transition_class: CompanyTransition, association_name: :transitions)
  end

  def after_confirmation
    self.update_attribute(:confirmed_at, DateTime.now)
  end
end
