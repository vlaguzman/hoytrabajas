class AffinityPercentages::UpdateAffinityPercentagesDailyJob < ApplicationJob
  queue_as :default

  def perform
    response = AffinityPercentages::ExecuteJobService.()
    action = 'daily_create_affinity_percentages'

    MailNotifier.general_notification(
      action,
      date: Time.now,
      response: response,
    ).deliver
  end
end
