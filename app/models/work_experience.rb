class WorkExperience < ApplicationRecord

  validates_presence_of :job_category, :work_position

  belongs_to :job_category
  belongs_to :work_methodology, optional: true
  belongs_to :contract_type, optional: true
  belongs_to :curriculum_vitae
  belongs_to :work_position
  belongs_to :city, optional: true

  has_and_belongs_to_many :technical_skills
end
