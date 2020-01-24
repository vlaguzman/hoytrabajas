class EducationalLevel < ApplicationRecord
  validates_presence_of :degree

  belongs_to :city, optional: true
  belongs_to :curriculum_vitae
  has_and_belongs_to_many :offers

  has_one_attached :diploma

  delegate :state_id, to: :city, prefix: :city, allow_nil: true
  delegate :state_country_id, to: :city, prefix: :city, allow_nil: true


end