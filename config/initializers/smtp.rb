ActionMailer::Base.smtp_settings = {
  :port           => ENV['587'],
  :address        => ENV['smtp.mailgun.org'],
  :user_name      => ENV['postmaster@sandbox37deedb7e6d0470e9baa9056a3dca9bb.mailgun.org'],
  :password       => ENV['fd56a6ddf6b34ea02e749aa244d66f80-bdb2c8b4-950e9286'],
  :domain         => 'chillwheel.heroku.com',
  :authentication => :plain,
}
ActionMailer::Base.delivery_method = :smtp
