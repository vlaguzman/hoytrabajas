class Offer < ApplicationRecord

  before_save -> { self.slug = self.title.parameterize }

  validates_presence_of :title, :job_category_ids

  validates_length_of :title, minimum: 3, maximum: 400

  scope :active, -> { where(status: 'active') }
  scope :max_offers, -> (max_offer_limit) { limit(max_offer_limit) }
  scope :created_at_desc, -> { order(created_at: :desc) }
  scope :related_job_category, -> (job_categories_ids) { joins(:job_categories).where("job_categories.id in (?)", job_categories_ids).uniq }
  scope :by_company_email, -> (company_email) { joins(:company).where('companies.email LIKE ?', company_email) }
  scope :by_company_name, -> (company_name) { joins(:company).where('companies.name LIKE ?', company_name) }
  scope :by_applied_offer_cv, -> (curriculum_vitae_id) { joins(:applied_offers).where(applied_offers: {curriculum_vitae_id: curriculum_vitae_id}) }

  has_one :offer_salary
  has_one :age_range

  has_many :applied_offers

  belongs_to :company
  belongs_to :city, optional: true
  belongs_to :offer_type, optional: true
  belongs_to :work_mode, optional: true
  belongs_to :contract_type, optional: true

  has_and_belongs_to_many :job_categories, optional: true
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
  has_and_belongs_to_many :requirements, optional: true

  has_one_attached :image

  #delegates
  delegate :from, :to, :currency_description, :period_description, :currency_id, :period_id, :is_range, to: :offer_salary, prefix: :salary, allow_nil: true
  delegate :from, :to, to: :age_range, prefix: :age_range, allow_nil: true
  delegate :description, :name, :web_site, :employees_range_description, to: :company, prefix: :company, allow_nil: true
  delegate :description, to: :city, prefix: :city, allow_nil: true
  delegate :description, to: :offer_type, prefix: :offer_type, allow_nil: true
  delegate :description, to: :work_mode, prefix: :work_mode, allow_nil: true
  delegate :description, to: :contract_type, prefix: :contract_type, allow_nil: true
  delegate :description, to: :available_work_days, prefix: :available_work_days, allow_nil: true
  delegate :description, to: :working_days, prefix: :working_days, allow_nil: true

  def self.not_applied_offers_by_cv(curriculum_vitae_id)
    Offer.all - self.by_applied_offer_cv(curriculum_vitae_id)
  end

  def languages_list
    LanguagesOffers.where(offer_id: self.id)
  end
end
