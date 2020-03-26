class OfferOnDemand < ApplicationRecord

  ONDEMAND_STATUS = ["up", "down"]

  validates_presence_of :status

  validates :status, inclusion: { in: ONDEMAND_STATUS }

  belongs_to :offer

  scope :active, -> { where(status: ONDEMAND_STATUS[0]) }
  scope :most_recently_created, -> { order(created_at: :desc) }
  scope :most_recently_offer_created, -> { joins(:offer).order('offers.created_at desc') }
end
