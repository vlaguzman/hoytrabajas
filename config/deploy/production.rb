server "ec2-3-234-3-185.compute-1.amazonaws.com", user: "deploy", roles: %w{app db web}

namespace :deploy do
  after :finishing, :notify do
    on roles(:app) do
      invoke "reload_app"
    end
  end
end

task :reload_app do
  on roles(:app) do |host|
    within current_path do
      as :deploy  do
        with rails_env: :production do
          execute "bin/reload"
        end
      end
    end
  end
end
