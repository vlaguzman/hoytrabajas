class OfferOnDemand < ApplicationRecord

  ONDEMAND_STATUS = ["up", "down"]

  validates_presence_of :status

  validates :status, inclusion: { in: ONDEMAND_STATUS }

  belongs_to :offer
end
