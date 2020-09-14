FactoryBot.define do
  factory :item do
    name                     {"あいうえお"}
    explanation              {"かきくけこ"}
    category_id              {Faker::Number.between(2,11)}
    status_id                {Faker::Number.between(2,7)}
    shipping_charges_id      {Faker::Number.between(2,3)}
    shipping_region_id       {Faker::Number.between(2,48)}
    days_until_shipping_id   {Faker::Number.between(2,4)} 
    selling_price            {Faker::Number.between(300,999999999)}
  end
end
