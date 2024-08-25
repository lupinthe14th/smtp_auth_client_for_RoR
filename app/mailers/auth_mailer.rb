class AuthMailer < ActionMailer::Base
  def authenticate
    mail(to: 'test@example.com', subject: 'SMTP Auth Test') do |format|
      format.text { render plain: 'This is a test.' }
    end
  end
end
