class CurriculumVitaesTechnicalSkills < ApplicationRecord
  belongs_to :curriculum_vitae
  belongs_to :technical_skill
  belongs_to :job_category
  belongs_to :level, optional: true

  delegate :description, to: :technical_skill,  prefix: :technical_skill, allow_nil: true

end