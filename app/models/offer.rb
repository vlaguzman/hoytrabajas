class Offer < ApplicationRecord
  validates_presence_of :title, :address, :cellphone, :description, :vacancies_quantity,
                        :close_date, :immediate_start, :required_experience,
                        :description_responsibilities, :release_date, :status

  scope :active, -> { where(status: 'active') }

  has_one :offer_salary
  has_one :age_range

  belongs_to :company
  belongs_to :city
  belongs_to :offer_type
  belongs_to :sex
  belongs_to :job_category
  belongs_to :work_mode
  belongs_to :contract_type

  has_and_belongs_to_many :terms
  has_and_belongs_to_many :functions
  has_and_belongs_to_many :job_aids
  has_and_belongs_to_many :vehicles
  has_and_belongs_to_many :driving_licences
  has_and_belongs_to_many :working_days
  has_and_belongs_to_many :available_work_days
  has_and_belongs_to_many :languages
  has_and_belongs_to_many :soft_skills
  has_and_belongs_to_many :technical_skills
  has_and_belongs_to_many :work_positions
  has_and_belongs_to_many :responsibilities
  has_and_belongs_to_many :educational_level

  has_one_attached :image

  #delegates
  delegate :description, :name, :web_site, :employees_range_description, to: :company, prefix: :company, allow_nil: true
  delegate :from, :to, :currency_description, :period_description, to: :offer_salary, prefix: :salary, allow_nil: true
  delegate :from, :to, to: :age_range, prefix: :age_range, allow_nil: true
  delegate :description, to: :sex, prefix: :sex, allow_nil: true
  delegate :description, to: :city, prefix: :city, allow_nil: true
  delegate :description, to: :offer_type, prefix: :offer_type, allow_nil: true
  delegate :description, to: :work_mode, prefix: :work_mode, allow_nil: true
  delegate :description, to: :contract_type, prefix: :contract_type, allow_nil: true
  delegate :description, to: :available_work_days, prefix: :available_work_days, allow_nil: true
  delegate :description, to: :working_days, prefix: :working_days, allow_nil: true

  def languages_list
    LanguagesOffers.where(offer_id: self.id)
  end
end
