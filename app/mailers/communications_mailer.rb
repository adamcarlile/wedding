class CommunicationsMailer < ApplicationMailer
  def question(delivery)
    @delivery = delivery
    
    mail to: delivery.invitee.to_email, subject: delivery.communication.title
  end
end
