class OfferRequiredExperiences < ApplicationRecord
  validates :duration, presence: true

  belongs_to :offer
  belongs_to :duration_type

  #delegates
  delegate :description, to: :duration_type, prefix: :duration_type, allow_nil: true

  validates_numericality_of :duration, :greater_than_or_equal_to => 1
end
