class Acknowledgment < ApplicationRecord
  validates_presence_of :title

  belongs_to :curriculum_vitae
  belongs_to :city, optional: true

  delegate :state_id, to: :city, prefix: :city, allow_nil: true
  delegate :state_country_id, to: :city, prefix: :city, allow_nil: true

  has_one_attached :diploma

end