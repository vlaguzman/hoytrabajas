class CurriculumVitaeSalary < ApplicationRecord
  validates_presence_of :to, :from

  belongs_to :curriculum_vitae
  belongs_to :salary_period
  belongs_to :currency
end
