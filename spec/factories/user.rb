FactoryBot.define do
  factory :user do
    email { Faker::Name.first_name+"@#{Faker::Name.last_name}.com" }
    password { Faker::Internet.password}
  end
end