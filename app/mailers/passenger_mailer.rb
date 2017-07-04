class PassengerMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email(passenger)
    @passenger = passenger
    mail(to: @passenger.email, subject: 'Thank you for booking the ticket.')
  end
end
