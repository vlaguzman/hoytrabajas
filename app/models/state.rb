class State < ApplicationRecord
  validates_presence_of :description

  has_many :cities
  belongs_to :country

  delegate :description, to: :country, prefix: :country, allow_nil: true

end
