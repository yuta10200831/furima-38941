FactoryBot.define do
  factory :purchase_card do

    post_code          { Faker::Number.decimal_part(digits: 3) + '-' + Faker::Number.decimal_part(digits: 4) }
    sender_id          { Faker::Number.between(from: 2, to: 47) }
    city               { Faker::Address.city }
    city_number        { Faker::Address.street_address }
    building_name      { Faker::Address.street_address }
    telephone_number   { Faker::Number.decimal_part(digits: 11) }
    token              { Faker::Internet.password(min_length: 20, max_length:30) }
  end
end