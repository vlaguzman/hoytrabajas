class Offer < ApplicationRecord
  include Searchable

  documement_type = 'offer'

  #TODO Oscar disable while sidekiq is in optimization
  #after_commit on: [:create, :update] do
  #  Elasticsearch::IndexerWorker.perform_async(documement_type, self.id, 'index')
  #end

  MIN_VALID_AFFINTY_PERCENTAGE = 20
  MAX_OFFER_LIMIT = 150
  ATTRIBUTES_TO_COMPARE = [:city_id, :work_mode_id, :contract_type_id]
  #TODO: Evaluate educational_level values and quantity
  LISTS_TO_COMPARE = [:job_categories, :working_days, :available_work_days, :languages_list,
  :technical_skills, :vehicles, :driving_licences, :soft_skills, :sexes, :educational_level]

  #TODO oscar: move this states to a state machine o create a db table
  OFFER_STATUS = ["expired", "hired", "active", "preview", "trash"]

  before_save -> { self.slug = self.title.parameterize }

  validates_presence_of :title, :job_category_ids

  validates :description, :close_date, :offer_type_id, presence: true, allow_nil: true

  validates_length_of :title, minimum: 3, maximum: 400

  validates :status, inclusion: { in: OFFER_STATUS }

  validates_numericality_of :vacancies_quantity, :greater_than_or_equal_to => 1, allow_nil: true

  scope :active, -> { where(status: OFFER_STATUS[2]) }
  scope :max_offers, -> (max_offer_limit) { limit(max_offer_limit) }
  scope :related_job_category, -> (job_categories_ids) { joins(:job_categories).where("job_categories.id in (?)", job_categories_ids).uniq }
  scope :by_company_email, -> (company_email) { joins(:company).where('companies.email LIKE ?', company_email) }
  scope :by_company_name, -> (company_name) { joins(:company).where('companies.name LIKE ?', company_name) }
  scope :by_applied_offer_cv, -> (curriculum_vitae_id) { joins(:applied_offers).where(applied_offers: {curriculum_vitae_id: curriculum_vitae_id}) }
  scope :by_job_categories_ids, -> (job_category_ids) { joins(:job_categories).where('job_category_id in (?)', job_category_ids).uniq }
  scope :most_recently_created, -> { order(created_at: :desc) }
  scope :on_demand_up, -> { joins(:offer_on_demand).where(:offer_on_demands=>{status: 'up'}).order("offer_on_demands.start_at DESC NULLS LAST") }
  scope :order_by_on_demand_created_at, -> { includes(:offer_on_demand).order("offer_on_demands.start_at ASC", created_at: :desc) }

  has_one :offer_salary

  has_one :offer_required_experiences
  has_one :offer_on_demand

  has_many :applied_offers
  has_many :affinity_percentages

  belongs_to :company
  belongs_to :city, optional: true
  belongs_to :offer_type, optional: true
  belongs_to :work_mode, optional: true
  belongs_to :contract_type, optional: true

  has_and_belongs_to_many :age_range_lists

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
  delegate :description, :email, :name, :web_site, :employees_range_description, :logo, to: :company, prefix: :company, allow_nil: true
  delegate :description, to: :city, prefix: :city, allow_nil: true
  delegate :state_id, to: :city, prefix: :city, allow_nil: true
  delegate :state_country_id, to: :city, prefix: :city, allow_nil: true
  delegate :description, to: :offer_type, prefix: :offer_type, allow_nil: true
  delegate :description, to: :work_mode, prefix: :work_mode, allow_nil: true
  delegate :description, to: :contract_type, prefix: :contract_type, allow_nil: true
  delegate :description, to: :available_work_days, prefix: :available_work_days, allow_nil: true
  delegate :description, to: :working_days, prefix: :working_days, allow_nil: true
  delegate :status, to: :offer_on_demand, prefix: :offer_on_demand, allow_nil: true
  delegate :duration, :duration_type_id, to: :offer_required_experiences, prefix: :required_experiences, allow_nil: true

  def self.by_job_categories(job_categories_ids)
    ids = self.by_job_categories_ids(job_categories_ids).pluck(:id)
    Offer.where(id: ids)
  end

  def self.not_applied_offers_by_cv(curriculum_vitae_id)
    ids = (Offer.all - self.by_applied_offer_cv(curriculum_vitae_id)).pluck(:id)
    Offer.where(id: ids)
  end

  def self.order_by_demand_and_created_at(current_user: nil, limit: MAX_OFFER_LIMIT)
    ordered_on_demand_and_affinity = Offers::OrderByAffinityPercentageService.(current_user: current_user, offers: Offer.on_demand_up)

    ordered_standard_and_affinity = Offers::OrderByAffinityPercentageService.(current_user: current_user, offers: (Offer.most_recently_created - Offer.on_demand_up))

    array_of_ids = ordered_on_demand_and_affinity.pluck(:id) + ordered_standard_and_affinity.pluck(:id)
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

  def work_position
    work_positions.last
  end

  def affinity_percentage_of(curriculum_vitae = nil)
    AffinityPercentageService.new(self, curriculum_vitae).get_round_affinity if curriculum_vitae.present?
  end

  #Elasticsearch configuration

  def self.index_settings
    { index:{
      number_of_shards: 1,
      number_of_replicas: 0,
      max_ngram_diff: 50
    }.merge(Elasticsearch::Common::Settings.()) }
  end

  settings index_settings do

    mappings dynamic: 'false' do
      # internal filters
      indexes :id, type: 'long'
      indexes :title, type: 'text', analyzer: :spanish
      indexes :description, type: 'text', analyzer: :spanish
      indexes :status, type: 'text'

      #sorters
      # - created_at
      indexes :created_at, type: 'date'

      #application filters
      # - city
      indexes :city, type: 'nested' do
        indexes :id, type: 'long'
        indexes :description, type: 'text'
      end

      # - job categories
      indexes :job_categories, type: 'nested' do
        indexes :id, type: 'long'
        indexes :description, type: 'text'
      end

      # - work mode
      indexes :work_mode, type: 'nested' do
        indexes :id, type: 'long'
        indexes :description, type: 'text'
      end

      # - contract_type
      indexes :contract_type, type: 'nested' do
        indexes :id, type: 'long'
        indexes :description, type: 'text'
      end

      # - working_days
      indexes :working_days, type: 'nested' do
        indexes :id, type: 'long'
        indexes :description, type: 'text'
      end

      # - available work days
      indexes :available_work_days, type: 'nested' do
        indexes :id, type: 'long'
        indexes :description, type: 'text'
      end

      # - job aids
      indexes :job_aids, type: 'nested' do
        indexes :id, type: 'long'
        indexes :description, type: 'text'
      end

      # - languages
      indexes :languages, type: 'nested' do
        indexes :id, type: 'long'
        indexes :description, type: 'text'
      end
    end

  end

  def as_indexed_json(options= {})
    as_json(
      only: [ :id, :title, :description, :status, :created_at ],
      include: {
        city: { only: [:id,:description] },
        job_categories: { only: [:id,:description] },
        work_mode: { only: [:id,:description] },
        contract_type: { only: [:id,:description] },
        working_days: { only: [:id,:description] },
        available_work_days: { only: [:id,:description] },
        job_aids: { only: [:id,:description] },
        languages: { only: [:id,:description] },
      }
    )
  end

  def self.search_by(**request_parameters)
      Elasticsearch::SearchService.(
        self,
        Elasticsearch::Offers::Queries,
        sort_class: Elasticsearch::Offers::Sorts,
        request_parameters: request_parameters
      )
  end

end
