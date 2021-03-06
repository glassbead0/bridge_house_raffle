class Ticket < ActiveRecord::Base
  validates :first_name, :last_name, :email, presence: true

  validates :email, format: { with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/,
    message: "not valid" }

  validates :email, format: { without: /\s/, message: 'can\'t contain spaces' }
  # validate :address_xor_phone_number


  private

  def address_xor_phone_number
    if !((address_line_one.blank? || city.blank? || state.blank?) ^ phone_number.blank?)
      errors.add(:base, "We need either an address or phone number to make sure we can contact you if you win.")
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
