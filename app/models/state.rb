class State < ApplicationRecord
  validates_presence_of :description

  has_many :cities
end
