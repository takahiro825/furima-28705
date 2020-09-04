FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name           {"後藤"}
    first_name            {"貴裕"}
    family_name_kana      {"ゴトウ"}
    first_name_kana       {"タカヒロ"}
    birthday              {Faker::Date.between_except(from: '1991-08-25', to: '2020-09-05', excepted: '2020-09-04')}
  end
end