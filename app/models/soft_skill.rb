class SoftSkill < ApplicationRecord
  validates_presence_of :description

  has_and_belongs_to_many :curriculum_vitaes
  has_and_belongs_to_many :recommendations
  has_and_belongs_to_many :offers
end