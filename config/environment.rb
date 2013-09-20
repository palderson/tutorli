# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Tutorli::Application.initialize!

ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.sendgrid.net',
  :port           => '587',
  :authentication => :plain,
  :user_name      => 'something@heroku.com',
  :password       => 'password',
  :domain         => 'domain.com'
}
ActionMailer::Base.delivery_method = :smtp

