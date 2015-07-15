ActionMailer::Base.smtp_settings = {
  :address => "smtp.mandrillapp.com",
  :port => 587,
  :authentication => :plain,
  :domain => 'geekometer.com',
  :user_name => 'geekometer.development@gmail.com',
  :password  => 'IJ4-RJzgZJdK0I48iOQrnA',
}
