class CurriculumVitae < ApplicationRecord
  validates_presence_of :user, :area_code, :cellphone_number, :city, :identification_number,
                        :tell_us, :release_date, :labor_disponibility, :document_type,
                        :handicap, :gender, :work_type, :contract_type, :travel_disponibility

  belongs_to :user
  belongs_to :city
  belongs_to :nationality
  belongs_to :labor_disponibility
  belongs_to :document_type
  belongs_to :handicap
  belongs_to :gender
  belongs_to :work_type
  belongs_to :contract_type

  has_many :visits

  has_and_belongs_to_many :soft_skills

  has_one_attached :photo
end