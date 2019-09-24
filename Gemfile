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
gem 'omniauth-facebook'
gem 'omniauth-google'
gem "haml-rails", "~> 2.0"
gem "simple_token_authentication", "~> 1.0"
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

gem 'bootsnap', '>= 1.4.2', require: false
gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'rspec-rails', '~> 4.0.0.beta2'
  gem 'capybara', '~>2.8'
  gem 'factory_bot_rails'
  gem 'curb'
  gem 'bullet'
  gem 'brakeman', require: false
  gem 'rails_best_practices'
  gem 'rubycritic'
  gem 'simplecov', :require => false
  gem 'simplecov-csv', :require => false
  gem 'shoulda', '~> 3.5'
  gem 'faker', :git => 'https://github.com/faker-ruby/faker.git', :branch => 'master'
  gem "rails-controller-testing"
  gem 'rspec-html-matchers'
  gem "guard", require: false
  gem "guard-rspec", require: false
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
