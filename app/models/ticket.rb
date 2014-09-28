class Ticket < ActiveRecord::Base
  validates :first_name, :last_name, :email,
            presence: true

  validate :address_xor_phone_number

  private

  def address_xor_phone_number
    if !((address_line_one.blank? || city.blank? || state.blank?) ^ phone_number.blank?)
      errors.add(:base, "We need either an address(with city & state) or phone number.")
    end
  end

  def charge_xor_payment
    if !(charge.blank? ^ payment.blank?)
      errors.add(:base, "Specify a charge or a payment, not both")
    end
  end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |ticket|
        csv << ticket.attributes.values_at(*column_names)
      end
    end
  end
end
