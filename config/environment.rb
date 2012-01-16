# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
DepotB::Application.initialize!

DepotB::Application.configure do
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.stmp_settings = {
  address: "smtp.gmail.com",
  port: 587,
  domain: "pragsex.com",
  authentication: "plain",
  user_name: "ttboy86@gmail.com",
  password: "Xoxota!86",
  enable_starttls_auto: true
  }
end