class Acknowledgment < ApplicationRecord

  belongs_to :curriculum_vitae

  has_one_attached :diploma

end