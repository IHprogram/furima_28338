FactoryBot.define do
  factory :buyer_receiver do
    postal_code { "123-4567" }
    prefecture { Prefecture.all.sample }
    city { Gimei.city.kanji }
    house_number { Gimei.town.kanji }
    building_name { "東京ハイツ" }
    phone_number { Faker::Number.number(digits: 11) }
    association :buyer
  end
end
