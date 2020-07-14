FactoryBot.define do
  factory :event do
    location { Faker::Address.building_number }
    date { Faker::Date.between(from: 1.year.ago, to: 1.year.from_now) }
    description { Faker::Lorem.sentence }
  end
end
