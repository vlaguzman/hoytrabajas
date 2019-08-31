class AppliedOffer < ApplicationRecord
  validates_presence_of :applied_date, :note

  belongs_to :offer
  belongs_to :curriculum_vitae
  belongs_to :applied_offer_status
end