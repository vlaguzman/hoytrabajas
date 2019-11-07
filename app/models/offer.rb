class Offer < ApplicationRecord

  before_save -> { self.slug = self.title.parameterize }

  validates_presence_of :title

  scope :active, -> { where(status: 'active') }
  scope :related_job_category, -> (job_category) { where(job_category: job_category) }
  scope :by_company_email, -> (company_email) { joins(:company).where('companies.email LIKE ?', company_email) }
  scope :by_company_name, -> (company_name) { joins(:company).where('companies.name LIKE ?', company_name) }

  has_one :offer_salary
  has_one :age_range

  belongs_to :company
  belongs_to :job_category
  belongs_to :city, optional: true
  belongs_to :offer_type, optional: true
  belongs_to :work_mode, optional: true
  belongs_to :contract_type, optional: true

  has_and_belongs_to_many :terms, optional: true
  has_and_belongs_to_many :functions, optional: true
  has_and_belongs_to_many :job_aids, optional: true
  has_and_belongs_to_many :vehicles, optional: true
  has_and_belongs_to_many :driving_licences, optional: true
  has_and_belongs_to_many :working_days, optional: true
  has_and_belongs_to_many :available_work_days, optional: true
  has_and_belongs_to_many :languages, optional: true
  has_and_belongs_to_many :soft_skills, optional: true
  has_and_belongs_to_many :technical_skills, optional: true
  has_and_belongs_to_many :work_positions, optional: true
  has_and_belongs_to_many :responsibilities, optional: true
  has_and_belongs_to_many :educational_level, optional: true
  has_and_belongs_to_many :sexes, optional: true

  has_one_attached :image

  #delegates
  delegate :description, :name, :web_site, :employees_range_description, to: :company, prefix: :company, allow_nil: true
  delegate :from, :to, :currency_description, :period_description, to: :offer_salary, prefix: :salary, allow_nil: true
  delegate :from, :to, to: :age_range, prefix: :age_range, allow_nil: true
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
