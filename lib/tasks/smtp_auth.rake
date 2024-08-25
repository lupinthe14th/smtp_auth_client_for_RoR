require_relative '../smtp_auth_tester'

namespace :smtp do
  desc "Test SMTP authentication"
  task auth: :environment do
    settings = Rails.application.config.action_mailer.smtp_settings
    SmtpAuthTester.test_auth(settings)
  end
end
