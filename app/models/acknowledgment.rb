class Acknowledgment < ApplicationRecord
  validates_presence_of :title

  belongs_to :curriculum_vitae
  belongs_to :city, optional: true

  has_one_attached :diploma

end