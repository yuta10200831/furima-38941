FactoryBot.define do
  factory :purchase_card do

    post_card          { Faker::Number}
    sender_id          { Faker::Number}
    city               { Faker::Number}
    city_number        { Faker::Number}
    building_name      { Faker::Number}
    telephone_number   { Faker::Number}
    user_id            { Faker::Number}
    item_id            { Faker::Number}

  end
end