# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

Mailgun.configure do |config|
  config.api_key = 'key-dcd90f07b80eda9ce143c030c38d8cbe'
end
