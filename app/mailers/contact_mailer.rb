class ContactMailer < ApplicationMailer

  default from: 'admin@aik-testguru.herokuapp.com'

  def contact(message)
    @name = message.name
    @email  = message.email
    @body = message.body
    mail(to: Admin.first.email, subject: "Contact from #{@name} ")
  end

end
