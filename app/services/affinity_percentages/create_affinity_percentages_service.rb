class AffinityPercentages::CreateAffinityPercentagesService
  include AffinityPercentages::AffinityPercentagesService

  def create_affinity(offer, curriculum_vitae)
    affinity_percentage_data = {
      offer_id:            offer.id,
      curriculum_vitae_id: curriculum_vitae.id,
      affinity_percentage: AffinityCalculator.new(offer, curriculum_vitae.user).affinity_percentage,
      version:             AffinityCalculator::VERSION,

    }.merge(
        offer_for_affinity_percentage(offer),
        curriculum_vitae_for_affinity_percentage(curriculum_vitae)
      )

    affinity_percentage = AffinityPercentage.new(affinity_percentage_data)
    persist_affinity_percentage(affinity_percentage)
  end

end
