class Aaronsmailer < Devise::Mailer
  include SendGrid
  default from: "bridgehouse@example.com"

end
