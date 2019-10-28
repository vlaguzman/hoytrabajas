# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

Mailgun.configure do |config|
  config.api_key = '75d6decc4a38d072d2760ad4edce2cb6-2dfb0afe-b78670c8'
end
