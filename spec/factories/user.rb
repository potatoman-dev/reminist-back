FactoryBot.define do
  factory :user do
    email { "user_1@example.com" }
    name { "ユーザー太郎_1" }
    password { "password" }
    password_confirmation { "password" }
  end
end
