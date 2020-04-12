
Datadog.configure do |c|
  if Rails.env.production?
    c.use :rails, service_name: 'production-rails-app'
    c.analytics_enabled = true
  end
end