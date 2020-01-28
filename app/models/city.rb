class City < ApplicationRecord
  validates_presence_of :description

  belongs_to :state

  scope :by_unaccent_description, -> (description) { where('unaccent(description) ILIKE unaccent(?)', "%#{description}%") }

  delegate :description, to: :state, prefix: :state, allow_nil: true
  delegate :country_description, to: :state, prefix: :state, allow_nil: true
  delegate :country_id, to: :state, prefix: :state, allow_nil: true
end
