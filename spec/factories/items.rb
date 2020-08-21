FactoryBot.define do
  factory :item do
    # imageカラムはここでは設定しない
    name { Faker::Lorem.words }
    content { Faker::Lorem.sentence }
    price { Faker::Number.between(from: 300, to: 9999999) }
    
    association :user
    category { Category.all.sample }
    status { Status.all.sample }
    shippingdate { Shippingdate.all.sample }
    fee { Fee.all.sample }
    prefecture { Prefecture.all.sample }

  end
end
