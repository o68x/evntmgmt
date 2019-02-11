FactoryBot.define do
  factory :event do
    start_date { Faker::Date.forward(30) }
    duration { rand(4..32) * 15 }
    title { Faker::Educator.course_name }
    description { Faker::Lorem.paragraph }
    price { rand(1..1000) }
    location { Faker::Restaurant.name }
    admin { FactoryBot.create (:user) }
  end
end
