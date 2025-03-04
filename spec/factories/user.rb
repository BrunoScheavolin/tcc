FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }
    role { 0 }
    password { "sdfas1211223" }
  end
end
