class CurriculumVitae < ApplicationRecord

  #TODO Oscar disable while sidekiq is in optimization
  #after_commit on: :update do
  #  AffinityPercentages::ExecuteUpdateWorker.perform_async(self.id)
  #end

  DEFAULT_MALE_USER_PROFILE_IMAGE   = ENV['DEFAULT_MALE_USER_PROFILE_IMAGE']
  DEFAULT_FEMALE_USER_PROFILE_IMAGE = ENV['DEFAULT_FEMALE_USER_PROFILE_IMAGE']
  DEFAULT_MAX_SIZE_IMAGE = 2000000

  ATTRIBUTES_TO_COMPARE = [:city_id]
  LISTS_TO_COMPARE      = [:job_categories, :working_days, :available_work_days, :technical_skills, :languages_list, :to_learn_skills, :soft_skills, :work_modes]

  validates_presence_of :user

  belongs_to :user,                 optional: true
  belongs_to :city,                 optional: true
  belongs_to :labor_disponibility,  optional: true
  belongs_to :contract_type,        optional: true

  has_one :curriculum_vitae_salary

  has_many :visits
  has_many :acknowledgments
  has_many :educational_levels
  has_many :applied_offers
  has_many :work_experiences
  has_many :affinity_percentages

  has_and_belongs_to_many :soft_skills
  has_and_belongs_to_many :educational_degrees
  has_and_belongs_to_many :working_days
  has_and_belongs_to_many :available_work_days
  has_and_belongs_to_many :technical_skills
  has_and_belongs_to_many :job_categories
  has_and_belongs_to_many :offer_types
  has_and_belongs_to_many :work_modes

  has_one_attached :photo
  has_one_attached :file_cv

  #delegates
  delegate :name, :email, to: :user, prefix: :user, allow_nil: true
  delegate :state_id, to: :city, prefix: :city, allow_nil: true
  delegate :salary_period_id, to: :curriculum_vitae_salary, allow_nil: true
  delegate :currency_id, :from, :to, to: :curriculum_vitae_salary,  prefix: :salary, allow_nil: true
  delegate :description, to: :contract_type, prefix: :contract_type, allow_nil: true
  delegate :description, to: :labor_disponibility, prefix: :labor_disponibility, allow_nil: true

  validate :validate_photo

  def validate_photo
    if photo.attached?
      if !photo.blob.content_type.starts_with?('image/')
        self.reload.photo.purge
        errors.add(:photo, I18n.t('activerecord.errors.models.curriculum_vitae.attributes.photo.invalid_format'))
      elsif photo.blob.byte_size > DEFAULT_MAX_SIZE_IMAGE
        self.reload.photo.purge
        errors.add(:photo, I18n.t('activerecord.errors.models.curriculum_vitae.attributes.photo.greather_that_two_mb'))
      end
    end
  end

  def languages_list
    strong_languages
  end

  def technical_skills
    strong_skills
  end

  def strong_skills
    CurriculumVitaesTechnicalSkills.where(curriculum_vitae_id: self.id, step_up: false)
  end

  def to_learn_skills
    CurriculumVitaesTechnicalSkills.where(curriculum_vitae_id: self.id, step_up: true)
  end

  def strong_languages
    CurriculumVitaesLanguages.where(curriculum_vitae_id: self.id)
  end
end
