class Acknowledgment < ApplicationRecord
  validates_presence_of :title

  belongs_to :curriculum_vitae

  has_one_attached :diploma

end