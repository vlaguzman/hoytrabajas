server "ec2-3-234-3-185.compute-1.amazonaws.com", user: "deploy", roles: %w{ db web }
server "ec2-54-234-213-19.compute-1.amazonaws.com", user: "deploy", roles: %w{ app }

namespace :deploy do
  after :finishing, :notify do
    on roles(:web) do
      invoke "reload_web"
    end
    on roles(:app) do
      invoke "reload_sidekiq"
    end
  end
end

task :reload_web do
  on roles(:web) do |host|
    within current_path do
      as :deploy do
        with rails_env: :production do
          execute "bin/reload"
        end
      end
    end
  end
end

task :reload_sidekiq do
  on roles(:app) do |host|
    within current_path do
      as :deploy do
        with rails_env: :production do
          #Restart sidekiq after any deploy
          execute :sudo, :systemctl, :restart, :sidekiq
        end
      end
    end
  end
end