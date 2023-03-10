FactoryBot.define do
  factory :item do
    association :user

    item_name { Faker::Name.name }
    explanation { Faker::Lorem.sentence }
    category_id { Faker::Number.between(from: 1, to: 10) }
    situation_id { Faker::Number.between(from: 1, to: 6) }
    delivery_charge_id { Faker::Number.between(from: 1, to: 2) }
    sender_id { Faker::Number.between(from: 1, to: 47) }
    number_of_day_id { Faker::Number.between(from: 1, to: 3) }
    price { Faker::Number.between(from: 300, to: 9_999_999) }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/008.jpg'), filename: 'images')
    end
  end
end
