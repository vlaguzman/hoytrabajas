namespace :sidekiq_check do
  task rerun: :environment do
    logs = Logger.new("#{Rails.root}/log/sidekiq_check.log")
    logs.info ["checking sidekiq..."]
    if Sidekiq::ProcessSet.new.size == 0
      logs.info ["sidekiq is not runnig, starting..."]
      exec 'bundle exec sidekiq -C config/sidekiq.yml -e production'
    end
  end
end