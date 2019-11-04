lock "~> 3.11.0"

set :application, "ht-ror"
set :repo_url, "git@bitbucket.org:vladimir_ht/ht-ror.git"
append :linked_files, "config/database.yml", "config/secrets.yml", ".env"
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system", "public/assets", "public/uploads", "node_modules"

set :rvm_type, :user
set :rvm_ruby_version, '2.6.3'
