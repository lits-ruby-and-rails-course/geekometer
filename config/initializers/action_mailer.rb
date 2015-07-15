ActionMailer::Base.smtp_settings = {
  :address => "smtp.mandrillapp.com",
  :port => 587,
  :authentication => :plain,
  :domain => 'geekometer.com',
  :user_name => 'geekometer.development@gmail.com',
  :password  => ENV['SMTP_PASSWORD'] || 'IJ4-RJzgZJdK0I48iOQrnA'
}
Rails.application.config.action_mailer.default_url_options = { :host => 'localhost:3000' }
Rails.application.config.action_mailer.delivery_method = :smtp
Rails.application.config.action_mailer.perform_deliveries = true
Rails.application.config.action_mailer.raise_delivery_errors = true
Rails.application.config.action_mailer.default :charset => "utf-8"
