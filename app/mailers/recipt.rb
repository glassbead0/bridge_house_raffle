class Recipt < ActionMailer::Base
  default from: "aaron.glasenapp@gmail.com"

  def recipt_wepay(ticket)
    @ticket = ticket
    mail to: ticket.email
  end

  def recipt_other(ticket)
    @ticket = ticket
    mail to: ticket.email
  end
end
