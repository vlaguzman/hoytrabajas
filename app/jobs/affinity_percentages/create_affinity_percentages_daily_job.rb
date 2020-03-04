class AffinityPercentages::CreateAffinityPercentagesDailyJob < ApplicationJob
  queue_as :default

  def perform
    affinity_percentages_error = AffinityPercentages::CreateAffinityPercentagesService.()

    MailNotifier.general_notification(
      date: Time.now,
      affinity_percentages_error: affinity_percentages_error,
    ).deliver
  end
end
