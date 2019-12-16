class CurriculumVitaeSalary < ApplicationRecord
  validates_presence_of :from

  validates :from, numericality: true
  validates :to, numericality: true, allow_nil: true

  belongs_to :curriculum_vitae
  belongs_to :salary_period
  belongs_to :currency
end