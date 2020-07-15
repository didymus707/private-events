FactoryBot.define do
  factory :event, aliases: %i[hosted_event attended_event] do
    location { Faker::Address.building_number }
    date { Faker::Date.between(from: 1.year.ago, to: 1.year.from_now) }
    description { Faker::Lorem.sentence }

    association :host, factory: :user
  end
end
