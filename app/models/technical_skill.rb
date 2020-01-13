class TechnicalSkill < ApplicationRecord
  validates_presence_of :description

  validates :description, uniqueness: { case_sensitive: false }

  has_and_belongs_to_many :recommendations
  has_and_belongs_to_many :offers
  has_and_belongs_to_many :curriculum_vitaes
  has_and_belongs_to_many :work_experiences
end