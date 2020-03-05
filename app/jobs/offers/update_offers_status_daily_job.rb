class Offers::UpdateOffersStatusDailyJob < ApplicationJob
  queue_as :default

  def perform(limit_date: Date.today)
    expired_offers = Offers::ExpiredService.(limit_date: limit_date)
    inactive_on_demand_offers = OffersOnDemand::SetInactiveService.(limit_date: limit_date)
    action = 'daily_update_offers'

    MailNotifier.general_notification(
      action,
      date: Time.now,
      fail_expired_offers: expired_offers,
      fail_inactive_on_demand_offers: inactive_on_demand_offers
    ).deliver
  end
end
