FactoryBot.define do
  factory :user do
    nickname { Faker::Internet.username }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
    family_name { Gimei.last.kanji }
    first_name { Gimei.first.kanji }
    family_name_furigana { Gimei.last.katakana }
    first_name_furigana { Gimei.first.katakana }
    birth_day { Faker::Date.birthday }
  end
end
