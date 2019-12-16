class City < ApplicationRecord
  validates_presence_of :description

  belongs_to :state

  delegate :description, to: :state, prefix: :state, allow_nil: true
end
