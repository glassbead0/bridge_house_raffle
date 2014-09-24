require 'rails_helper'

RSpec.describe Admin, :type => :model do
  it { should have_one :event }
end
