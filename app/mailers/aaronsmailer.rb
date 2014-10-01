class Aaronsmailer < Devise::Mailer
  include SendGrid
  default from: "aaron.glasenapp@gmail.com"


end
