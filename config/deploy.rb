lock "~> 3.11.0"

set :application, "ht-ror"
set :repo_url, "git@bitbucket.org:vladimir_ht/ht-ror.git"
append :linked_files, "config/database.yml", "config/secrets.yml"
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system", "public/assets", "public/uploads", "node_modules"

set :rvm_type, :user                     # Defaults to: :auto
set :rvm_ruby_version, '2.6.3'      # Defaults to: 'default'

namespace :deploy do
  after :finishing, :notify do
    `bin/reload`
  end
end
