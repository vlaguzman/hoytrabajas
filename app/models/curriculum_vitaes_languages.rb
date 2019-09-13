class CurriculumVitaesLanguages < ApplicationRecord
  belongs_to :curriculum_vitae
  belongs_to :language
  belongs_to :level
end