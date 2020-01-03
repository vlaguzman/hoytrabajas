class Offers::UpdateOffersStatusDailyJob < ApplicationJob
  queue_as :default

  def perform(limit_date: Date.today)
    Offers::ExpiredService.(limit_date: limit_date)
    OffersOnDemand::SetInactiveService.(limit_date: limit_date)
  end
end
