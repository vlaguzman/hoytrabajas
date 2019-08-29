class OffersTerms < ApplicationRecord
  validates_presence_of :time

  belongs_to :offer
  belongs_to :term
end
