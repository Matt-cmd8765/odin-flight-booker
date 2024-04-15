class PassengerMailer < ApplicationMailer
  # This and welcome email from https://guides.rubyonrails.org/action_mailer_basics.html section 2.1.2
  default from: 'notifications@example.com'

  def welcome_email
    @user = params[:user]
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
