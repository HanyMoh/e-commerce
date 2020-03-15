FactoryBot.define do
  factory :entry do
    price { '9.99' }
    pocket { nil }
    order { nil }
    sub_product { nil }
    quantity { 1 }
  end
end
