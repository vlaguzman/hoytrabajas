server "ec2-35-170-202-220.compute-1.amazonaws.com", user: "deploy", roles: %w{app db web}

namespace :deploy do
  after :finishing, :notify do
    `ssh deploy@ec2-35-170-202-220.compute-1.amazonaws.com "cd /var/www/ht-ror/current/; ./bin/reload"`
  end
end
