class City < ApplicationRecord
  validates_presence_of :description

  belongs_to :state
end
