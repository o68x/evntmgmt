FactoryBot.define do
  factory :attendance do
    stripe_customer_id { "MyString" }
    user { nil }
    event { nil }
  end
end
