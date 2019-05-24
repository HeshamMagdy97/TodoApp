
FactoryBot.define do
  factory :todo do
    title { Faker::Lorem.word }
    description { Faker::Lorem.paragraph(2)}
    association :user, factory: :user
    todo_type {[:task, :event].sample }
  end
end
