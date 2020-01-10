#ENV.each { |k, v| env(k, v) }
set :output, {:error => 'tmp/cron.error.log', :standard => 'tmp/cron.standard.log'}
set :chronic_options, hours24: true

every 1.minute, mailto: 'oscar.guzman@hoytrabajas.com' do
  command "/usr/bin/echo 'Oscar Testing from production'"
end

every 1.day, at: '23:59',  mailto: 'tecnologia@hoytrabajas.com' do
  command "/usr/bin/echo 'Updating Offers...'"
  runner 'Offers::UpdateOffersStatusDailyJob.new.perform(limit_date: Date.today)'
  command "/usr/bin/echo 'Offers Updated'"
end
