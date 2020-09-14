FactoryBot.define do
  factory :purchases_shipping do
    postal_code        {"123-4567"}
    prefectures_id     {2}
    city                {"福岡市"}
    address              {"中央区大名２丁目"}
    phone_number         {"09012345678"}
    token              { "sampletokentesttokentest"}
    association :user
    association :item
  end
end
