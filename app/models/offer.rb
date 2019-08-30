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
end