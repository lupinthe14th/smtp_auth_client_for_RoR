require 'net/smtp'

class SmtpAuthTester
  def self.test_auth(settings)
    smtp = Net::SMTP.new(settings[:address], settings[:port])
    smtp.enable_starttls_auto if settings[:enable_starttls_auto]
    smtp.open_timeout = 5
    smtp.read_timeout = 5

    begin
      smtp.start(settings[:domain], settings[:user_name], settings[:password], settings[:authentication])
      puts "SMTP authentication successful"
      true
    rescue Net::SMTPAuthenticationError
      puts "SMTP authentication failed"
      false
    rescue => e
      puts "SMTP authentication error: #{e.message}"
      false
    ensure
      smtp.finish if smtp.started?
    end
  end
end
