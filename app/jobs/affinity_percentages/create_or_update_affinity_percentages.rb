class AffinityPercentages::CreateOrUpdateAffinityPercentages < ApplicationJob
  queue_as :default

  def perform
    CreateOrUpdateAffinityPercentagesService.()
  end
end
