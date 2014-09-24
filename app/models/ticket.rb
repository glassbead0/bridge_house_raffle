class Ticket < ActiveRecord::Base
  validates :first_name, :last_name, :email,
            :address_line_one, :city, :state,
            :zip_code, :phone_number,
            presence: true

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |ticket|
        csv << ticket.attributes.values_at(*column_names)
      end
    end
  end
end
