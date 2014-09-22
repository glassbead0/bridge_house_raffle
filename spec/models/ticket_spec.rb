require 'rails_helper'

RSpec.describe Ticket, type: :model do
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  it { should validate_presence_of :email }
  it { should validate_presence_of :address_line_one }
  it { should validate_presence_of :city }
  it { should validate_presence_of :state }
  it { should validate_presence_of :zip_code }
  it { should validate_presence_of :phone_number }
end
