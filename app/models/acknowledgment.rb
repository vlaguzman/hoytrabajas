class Acknowledgment < ApplicationRecord
  validates_presence_of  :title, :start_date, :entity_name

  belongs_to :curriculum_vitae

  has_one_attached :diploma

end