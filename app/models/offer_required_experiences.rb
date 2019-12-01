class OfferRequiredExperiences < ApplicationRecord
  validates_presence_of :duration

  belongs_to :offer
  belongs_to :duration_type

  #delegates
  delegate :description, to: :duration_type, prefix: :duration_type, allow_nil: true
end
