source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'rails', '~> 6.0.0'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5'
gem 'webpacker'
gem 'react-rails'
gem 'jbuilder', '~> 2.7'
gem 'devise'
gem 'mailgun-ruby', '~>1.1.6'
gem 'activeadmin'
gem 'active_admin_datetimepicker'
gem 'omniauth-facebook'
gem 'omniauth-google'
gem "haml-rails", "~> 2.0"
gem "simple_token_authentication", "~> 1.0"
gem 'ransack'
gem "aws-sdk-s3"
gem 'simple_form'
gem 'statesman', '~> 5.1.0'
gem 'whenever', require: false
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  gem 'letter_opener_web', '~> 1.0'
  gem 'ed25519', '~> 1.2'
  gem 'bcrypt_pbkdf', '~> 1'
  gem 'rspec-rails', '~> 4.0.0.beta2'
  gem 'capybara', '~>3.18.0'
  gem 'factory_bot_rails'
  gem 'rails_best_practices'
  gem 'shoulda', '~> 3.5'
  gem 'faker', :git => 'https://github.com/faker-ruby/faker.git', :branch => 'master'
  gem "rails-controller-testing"
  gem 'rspec-html-matchers'
  gem "selenium-webdriver",'~>3.141.0'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'timecop'
  gem 'database_cleaner'
end

group :development do
  gem "guard", require: false
  gem "guard-rspec", require: false
  gem 'simplecov', :require => false
  gem 'simplecov-csv', :require => false
  gem "rubycritic", require: false
  gem 'brakeman', require: false
  gem 'bullet'
  gem 'curb'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'capistrano-rails'
  gem 'capistrano-rvm', github: 'capistrano/rvm'
  gem 'capistrano-env-config'
end
