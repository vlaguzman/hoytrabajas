class AffinityPercentages::UpdateAffinityPercentagesDailyJob < ApplicationJob
  queue_as :default

  def perform
    AffinityPercentages::ExecuteJobService.()
  end
end
