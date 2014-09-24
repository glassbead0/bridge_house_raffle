# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ticket do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email}
    subscribe false
    address_line_one { Faker::Address.street_address}
    address_line_two { Faker::Address.secondary_address}
    city { Faker::Address.city_prefix + Faker::Address.city_suffix }
    state { Faker::Address.state_abbr }
    phone_number { Faker::PhoneNumber.phone_number }
    zip_code { Faker::Address.zip }
  end
end
