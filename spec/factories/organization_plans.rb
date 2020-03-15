FactoryBot.define do
  factory :organization_plan do
    country { 'MyString' }
    stores_count { 1 }
    price { '9.99' }
    organization { nil }
  end
end
