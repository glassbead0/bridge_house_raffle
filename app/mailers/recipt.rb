class Recipt < ActionMailer::Base
  default from: "aaron.glasenapp@gmail.com"

  def ticket_recipt(ticket)
    @ticket = ticket
    @num = ticket.number_of_tickets
    mail to: ticket.email
  end
end
