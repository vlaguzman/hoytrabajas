class AgeRange < ApplicationRecord
  validates_presence_of :from, :to

  belongs_to :offer

  validates_numericality_of :from, :greater_than_or_equal_to => 1
  validates_numericality_of :to,   :greater_than_or_equal_to => 1
end
