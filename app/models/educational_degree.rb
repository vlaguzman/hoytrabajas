class EducationalDegree < ApplicationRecord

  validates_presence_of :description

  has_and_belongs_to_many :curriculum_vitaes
  has_and_belongs_to_many :users

end
