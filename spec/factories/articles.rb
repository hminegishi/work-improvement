FactoryBot.define do
  factory :article do
    title {Faker::Lorem.sentence}
    text  {Faker::Lorem.sentence}
    image {Faker::Lorem.sentence}
    category_id          { 2 }
    association :user
  end
end
