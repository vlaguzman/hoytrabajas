class Offer < ApplicationRecord
  MAX_OFFER_LIMIT = 150
  ATTRIBUTES_TO_COMPARE = [:city_id, :work_mode_id, :contract_type_id]
  #TODO: Evaluate educational_level values and quantity
  LISTS_TO_COMPARE = [:job_categories, :working_days, :available_work_days, :languages_list,
  :technical_skills, :vehicles, :driving_licences, :soft_skills, :sexes, :educational_level]

  #TODO oscar: move this states to a state machine o create a db table
  OFFER_STATUS = ["expired", "hired", "active", "preview", "trash"]

  before_save -> { self.slug = self.title.parameterize }

  validates_presence_of :title, :job_category_ids

  validates :description, presence: true, allow_nil: true

  validates_length_of :title, minimum: 3, maximum: 400

  validates :status, inclusion: { in: OFFER_STATUS }

  scope :active, -> { where(status: OFFER_STATUS[2]) }
  scope :max_offers, -> (max_offer_limit) { limit(max_offer_limit) }
  scope :related_job_category, -> (job_categories_ids) { joins(:job_categories).where("job_categories.id in (?)", job_categories_ids).uniq }
  scope :by_company_email, -> (company_email) { joins(:company).where('companies.email LIKE ?', company_email) }
  scope :by_company_name, -> (company_name) { joins(:company).where('companies.name LIKE ?', company_name) }
  scope :by_applied_offer_cv, -> (curriculum_vitae_id) { joins(:applied_offers).where(applied_offers: {curriculum_vitae_id: curriculum_vitae_id}) }
  scope :by_job_categories_ids, -> (job_category_ids) { joins(:job_categories).where('job_category_id in (?)', job_category_ids).uniq }
  scope :created_at_desc, -> { order(created_at: :desc) }
  scope :on_demand_up, -> { joins(:offer_on_demand).where(:offer_on_demands=>{status: 'up'}).order("offer_on_demands.start_at DESC NULLS LAST") } 
  scope :order_by_on_demand_and_created_at, -> { includes(:offer_on_demand).order("offer_on_demands.start_at ASC", created_at: :desc) }

  has_one :offer_salary
  has_one :age_range
  has_one :offer_required_experiences
  has_one :offer_on_demand

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
  delegate :description, :email, :name, :web_site, :employees_range_description, to: :company, prefix: :company, allow_nil: true
  delegate :description, to: :city, prefix: :city, allow_nil: true
  delegate :state_id, to: :city, prefix: :city, allow_nil: true
  delegate :state_country_id, to: :city, prefix: :city, allow_nil: true
  delegate :description, to: :offer_type, prefix: :offer_type, allow_nil: true
  delegate :description, to: :work_mode, prefix: :work_mode, allow_nil: true
  delegate :description, to: :contract_type, prefix: :contract_type, allow_nil: true
  delegate :description, to: :available_work_days, prefix: :available_work_days, allow_nil: true
  delegate :description, to: :working_days, prefix: :working_days, allow_nil: true
  delegate :duration, :duration_type_id, to: :offer_required_experiences, prefix: :required_experiences, allow_nil: true

  def self.by_job_categories(job_categories_ids)
    ids = self.by_job_categories_ids(job_categories_ids).pluck(:id)
    Offer.where(id: ids)
  end

  def self.not_applied_offers_by_cv(curriculum_vitae_id)
    ids = (Offer.all - self.by_applied_offer_cv(curriculum_vitae_id)).pluck(:id)
    Offer.where(id: ids)
  end

  def self.order_by_demand_and_created_at(limit = MAX_OFFER_LIMIT)
    array_of_ids = Offer.on_demand_up.pluck(:id) + (Offer.created_at_desc - Offer.on_demand_up).pluck(:id)
    Offer.find(array_of_ids.take(limit)).sort_by{|offer| array_of_ids.index offer.id}
  end

  def languages_list
    LanguagesOffers.where(offer_id: self.id)
  end

  def strong_skills
    OffersTechnicalSkills.where(offer_id: self.id)
  end

  def strong_languages
    LanguagesOffers.where(offer_id: self.id)
  end
end
