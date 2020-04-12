ENV.each { |k, v| env(k, v) }
env 'RAILS_ENV', 'production'
set :bundle_command, 'bundle exec'
set :output, {:error => '/tmp/cron.error.log', :standard => '/tmp/cron.standard.log'}
set :chronic_options, hours24: true

#TODO Oscar disable while sidekiq is in optimization
#every 5.minutes do
#  rake 'sidekiq_check:rerun'
#end

every 1.day, at: '04:59' do
  command "echo 'Updating Offers...'"
  runner 'Offers::UpdateOffersStatusDailyJob.new.perform(limit_date: Date.today)'
  command "echo 'Offers Updated'"
end

every 1.day, at: '04:50' do
  #command "echo 'Updating AffinityPercentages...'"
  #runner 'AffinityPercentages::UpdateAffinityPercentagesDailyJob.new.perform'
  #command "echo 'AffinityPercentages Updated'"
end

every 1.day at: '5:00' do
  rake "-s sitemap:refresh"
end
