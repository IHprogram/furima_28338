FactoryBot.define do
  factory :buyer_receiver do
    token {"tok_xxxxxxxxxxxxxxxxxxxxxxxxxxx"}
    postal_code { "123-4567" }
    prefecture_id { 2 }
    city { Gimei.city.kanji }
    house_number { Gimei.town.kanji }
    building_name { "東京ハイツ" }
    phone_number { Faker::Number.number(digits: 11) }
  end
end
