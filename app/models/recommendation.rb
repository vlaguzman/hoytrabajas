class Recommendation < ApplicationRecord
  validates_presence_of :recommendation

  belongs_to :curriculum_vitae
end