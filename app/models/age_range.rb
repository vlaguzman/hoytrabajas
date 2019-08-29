class AgeRange < ApplicationRecord
  validates_presence_of :from, :to

  belongs_to :offer
end