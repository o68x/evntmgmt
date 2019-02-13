FactoryBot.define do
  factory :user do
    email { Faker::Internet.safe_email }
    password { Faker::Internet.safe_email }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.first_name }
    description { Faker::Lorem.paragraphs.join('\n\n') }
  end
end
