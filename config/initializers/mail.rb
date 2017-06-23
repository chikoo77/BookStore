ActionMailer::Base.smtp_settings = {
    address: "smtp-relay.gmail.com",
    port: 587,
    enable_starttls_auto: true,
    user_name: ENV['GOOGLE_USERNAME_SMTP'],
    password: ENV['GOOGLE_PASSWORD_SMTP'],
    authentication: "login"
}

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.default charset: "utf-8"
