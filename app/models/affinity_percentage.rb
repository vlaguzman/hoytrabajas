class AffinityPercentage < ApplicationRecord

  belongs_to :offer
  belongs_to :curriculum_vitae

  def self.get_last(offer_id, curriculum_vitae_id)
    where(offer_id: offer_id, curriculum_vitae_id: curriculum_vitae_id).last
  end
end
