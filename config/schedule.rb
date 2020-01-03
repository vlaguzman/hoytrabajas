ENV.each { |k, v| env(k, v) }

set :chronic_options, hours24: true

every 1.day, at: '23:59' do
  runner 'Offers::UpdateOffersStatusDailyJob.perform(limit_date: Date.today)'
end