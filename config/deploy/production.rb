server "ec2-35-170-202-220.compute-1.amazonaws.com", user: "deploy", roles: %w{app db web}

namespace :deploy do
  after :finishing, :notify do
    on roles(:app) do
      within current_path do
        as :deploy  do
          with rails_env: :production do
            execute "bin/reload", :shell => fetch(:rvm_shell)
          end
        end
      end
    end
  end
end

task :haga_bundle do
  on roles(:app) do |host|
    within current_path do
      as :deploy  do
        with rails_env: :production do
          execute './bin/reload'
        end
      end
    end
  end
end
