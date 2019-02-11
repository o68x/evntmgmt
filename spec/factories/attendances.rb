FactoryBot.define do
  factory :attendance do
    stripe_customer_id { Faker::Internet.password }
    user { FactoryBot.create (:user) }
    event { FactoryBot.create (:event) }
  end
end
