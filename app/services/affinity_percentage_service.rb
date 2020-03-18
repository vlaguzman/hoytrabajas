class AffinityPercentageService

  attr_reader :offer, :curriculum_vitae

  def initialize(offer, curriculum_vitae)
    @offer = offer
    @curriculum_vitae = curriculum_vitae
  end

  def get_round_affinity
    if last_affinity_percentage.present?
      validate_affinity(last_affinity_percentage.affinity_percentage.round)
    else
      validate_affinity(get_new_affinity_percentage)
    end
  end

  def validate_affinity(percentage)
    percentage if percentage >= Offer::MIN_VALID_AFFINTY_PERCENTAGE
  end

  def last_affinity_percentage
    AffinityPercentage.get_last(offer.id, curriculum_vitae.id)
  end

  def get_new_affinity_percentage
    affinity = create_affinity_percentage
    affinity.present? ? affinity.affinity_percentage.round : 0
  end

  def create_affinity_percentage
    AffinityPercentages::CreateAffinityPercentagesService.new.create_affinity(offer, curriculum_vitae)
  end
end
