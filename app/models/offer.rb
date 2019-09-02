class Offer < ApplicationRecord
  validates_presence_of :title, :address, :cellphone, :description, :vacancies_quantity,
                        :close_date, :immediate_start, :required_experience,
                        :description_responsibilities, :release_date, :status

  belongs_to :user
  belongs_to :city
  belongs_to :job_category
  belongs_to :offer_type
  belongs_to :job_category
  belongs_to :gender
  belongs_to :job_category
  belongs_to :work_type
  belongs_to :job_category
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
end