class Limitation < ApplicationRecord

  validates_presence_of :description, :user

  has_and_belongs_to_many :curriculum_vitaes
  has_and_belongs_to_many :user

end
