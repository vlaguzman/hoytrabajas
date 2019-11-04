# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

Mailgun.configure do |config|
  config.api_key = ENV['API_KEY']
end
