class CurriculumVitae < ApplicationRecord
  validates_presence_of :user

  belongs_to :user,                 optional: true
  belongs_to :city,                 optional: true
  belongs_to :labor_disponibility,  optional: true
  belongs_to :work_mode,            optional: true
  belongs_to :contract_type,        optional: true

  has_many :visits

  has_and_belongs_to_many :soft_skills
  has_and_belongs_to_many :educational_degrees
  has_and_belongs_to_many :vehicles
  has_and_belongs_to_many :working_days
  has_and_belongs_to_many :available_work_days
  has_and_belongs_to_many :languages
  has_and_belongs_to_many :technical_skills
  has_and_belongs_to_many :job_categories

  has_one_attached :photo
end