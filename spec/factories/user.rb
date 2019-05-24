
FactoryBot.define do
  factory :user do
    email { Faker::Name.first_name+"@THISPART.com" }
    password { Faker::Internet.password}
  end
end