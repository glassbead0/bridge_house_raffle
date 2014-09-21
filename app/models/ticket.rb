class Ticket < ActiveRecord::Base
  validates :first_name, :last_name, :email,
            :address_line_one, :address_line_two,
            :city, :state, :zip_code,
            :phone_number, presence: true
end
