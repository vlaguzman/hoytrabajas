class CurriculumVitaesTechnicalSkills < ApplicationRecord
  validates_presence_of :step_up

  belongs_to :curriculum_vitae
  belongs_to :technical_skill
  belongs_to :job_category
  belongs_to :level
end
