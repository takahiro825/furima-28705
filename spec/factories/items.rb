FactoryBot.define do
  factory :item do
    name                     {Faker::Name.initials(number:2)}
    explanation              {Faker::Word.between(5.999)}
    category_id              {Faker::Number.between(2,11)}
    status_id                {Faker::Number.between(2,7)}
    shipping_charges_id      {Faker::Number.between(2,3)}
    shipping_region_id       {Faker::Number.between(2,48)}
    selling_price            {Faker::Number.between(300,999999999)}
  end
end
