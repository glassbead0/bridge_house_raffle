json.array!(@tickets) do |ticket|
  json.extract! ticket, :id, :first_name, :last_name, :email, :subscribe, :address_line_one, :address_line_two, :city, :state, :zip_code
  json.url ticket_url(ticket, format: :json)
end
