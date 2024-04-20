class PassengerMailer < ApplicationMailer
  # This and welcome email from https://guides.rubyonrails.org/action_mailer_basics.html section 2.1.2
  default from: 'notifications@example.com'
  
  # TODO: update user to passenger
  def welcome_email
    @booking = params[:booking]
    @url  = 'http://example.com/login'
    @booking.passengers.each do |passenger|
      @passenger = passenger
      mail(to: passenger.email, subject: 'Booking Confirmed')
    end
  end
end
