module AffinityPercentages::ExecuteJobService

  def self.call
    affinity_percentages = AffinityPercentage.select { |affinity| affinity.offer.updated_at > affinity.created_at }
    affinity_percentages.map { |affinity| AffinityPercentages::UpdateAffinityPercentagesService.(affinity, :offer_updated) }
  end

end
