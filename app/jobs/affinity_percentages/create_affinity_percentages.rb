class AffinityPercentages::CreateAffinityPercentages < ApplicationJob
  queue_as :default

  def perform
    AffinityPercentages::CreateAffinityPercentagesService.()
  end
end
