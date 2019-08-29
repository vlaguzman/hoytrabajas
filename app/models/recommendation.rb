class Recommendation < ApplicationRecord
  validates_presence_of :recommendation, :back_to_work_score

  belongs_to :curriculum_vitae

  has_and_belongs_to_many :soft_skills
  has_and_belongs_to_many :technical_skills
end