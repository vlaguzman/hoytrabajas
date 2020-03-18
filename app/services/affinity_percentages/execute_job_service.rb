module AffinityPercentages::ExecuteJobService

  def self.call
    affinity_percentages = Offer
      .active
      .joins(:affinity_percentages)
      .where("offers.updated_at > affinity_percentages.created_at")
      .distinct
      .map { |offer| offer.affinity_percentages }
      .flatten

    affinity_percentages.map do |affinity|
      AffinityPercentages::UpdateAffinityPercentagesService.new.update_affinity(affinity, :offer_updated)
    end
  end

end
