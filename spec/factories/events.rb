FactoryBot.define do
  factory :event do
    start_date { "2019-02-11 13:07:27" }
    duration { 1 }
    title { "MyString" }
    description { "MyText" }
    price { 1 }
    location { "MyString" }
  end
end
