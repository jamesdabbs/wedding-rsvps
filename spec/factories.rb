FactoryBot.define do
  factory :rsvp do
    name      { Faker::Name.name }
    email     { Faker::Internet.safe_email }
    attending { [true, false].sample }
    diet      { Faker::Lorem.paragraph }
    comments  { Faker::Lorem.paragraph }
  end
end