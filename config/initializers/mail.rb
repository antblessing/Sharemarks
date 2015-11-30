ActionMailer::Base.smtp_settings = {
  port:          587,
  address:       'smtp.mailgun.org',
  user_name:     ENV['MAILGUN_SMTP_LOGIN'],
  password:      ENV['MAILGUN_SMTP_PASSWORD'],
  domain:       'appb086a34dd1504991aefd135bc94b1130.mailgun.org',
  authentication: :plain,
  content_type:  'text/html'
}

ActionMailer::Base.delivery_method = :smtp

ActionMailer::Base.raise_delivery_errors = true