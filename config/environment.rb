# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
TajmLaps::Application.initialize!

TajmLaps::Application.configure do
  # Email
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.perform_deliveries = true
  config.action_mailer.default_url_options = { :host => 'test.doma.cz' }
  config.action_mailer.smtp_settings = {
    address: 'smtp.gmail.com',
    port: '587',
    enable_starttls_auto: true,
    user_name: '',
    password: '',
    # authentication => :plain,
    # domain => 'somedomain.com'
  }
end
