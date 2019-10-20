class AppliedOffer < ApplicationRecord
  validates_presence_of :applied_date, :offer_id, :curriculum_vitae_id, :applied_offer_status_id

  belongs_to :offer
  belongs_to :curriculum_vitae
  belongs_to :applied_offer_status
end
