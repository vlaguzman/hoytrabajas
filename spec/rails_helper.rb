require "simplecov"
require "simplecov-csv"
SimpleCov.formatters = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::HTMLFormatter,
  SimpleCov::Formatter::CSVFormatter,
])

SimpleCov.start 'rails' do
  add_filter "/spec/"
  add_filter "/gems/"
  add_filter "/config/"
  add_filter "/app/controllers/"
  add_filter "/app/admin/"
end
# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
# Add additional requires below this line. Rails is not loaded until this point!

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Dir[Rails.root.join('spec', 'support', '**', '*.rb')].each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
# If you are not using ActiveRecord, you can remove these lines.
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end
RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = false

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, :js => true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, :type => :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")

  #Config Shoulda Matchers to Rspec
  Shoulda::Matchers.configure do |config|
    config.integrate do |with|
      with.test_framework :rspec
      with.library :rails
    end
  end

  #Rspec HTML Matchers
  config.include RSpecHtmlMatchers

  #FactoryBot Helper
  config.include FactoryBot::Syntax::Methods

  #Devise Helper
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include Devise::Test::ControllerHelpers, type: :view
  config.include Devise::Test::IntegrationHelpers, type: :feature
  config.include Devise::Test::IntegrationHelpers, type: :request

  ip = `/sbin/ip route|awk '/scope/ { print $9 }'`
  ip.gsub!(/\n/, "")

  #If your pc have low specifications and fail the test that use JS, uncoment this line
  #to wait x secs until capybara run the js action in the
  #test, dont let uncomment this make the tests slower
  Capybara.default_max_wait_time = 8

  Capybara.javascript_driver = :selenium_chrome
  Capybara.register_driver :selenium_chrome do |app|
    caps = Selenium::WebDriver::Remote::Capabilities.chrome(
      chromeOptions: {args: %w(headless disable-gpu no-sandbox --window-size=1366,768--user-agent='Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:56.0) Gecko/20100101 Firefox/56.0')},
      loggingPrefs:  {browser: 'ALL'}
    )

    Capybara::Selenium::Driver.new(nil, browser: :remote, url: "http://selenium:4444/wd/hub", desired_capabilities: caps).tap do |driver|
      driver.browser.file_detector = -> args do
        str = args.first.to_s
        str if File.exist?(str)
      end
    end
  end

  config.around(:each, type: :feature) do |example|
    js = example.metadata[:js] || false

    if js
      Capybara.server = :webrick
      old_host = Capybara.server_host
      old_port = Capybara.server_port
      old_app_host = Capybara.app_host

      Capybara.server_host = ip
      Capybara.server_port = 3001
      Capybara.app_host = "http://#{Capybara.server_host}:#{Capybara.server_port}"

      example.run

      Capybara.server_host = old_host
      Capybara.server_port = old_port
      Capybara.app_host = old_app_host
    else
      old_app_host = Capybara.app_host

      Capybara.app_host = 'http://localhost:3000'
      example.run

      Capybara.app_host = old_app_host
    end
  end
end
