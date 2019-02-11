FactoryBot.define do
  factory :user do
    email { "MyString" }
    encrypted_password { "MyString" }
    first_name { "MyString" }
    last_name { "MyString" }
    description { "MyText" }
  end
end
