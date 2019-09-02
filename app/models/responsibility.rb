class Responsibility < ApplicationRecord
  validates_presence_of :description

  has_and_belongs_to_many :offers
end