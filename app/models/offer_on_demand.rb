class OfferOnDemand < ApplicationRecord
  validates_presence_of :status

  belongs_to :offer
end
