FactoryBot.define do
  factory :event, aliases: [:hosted_event, :attended_event] do
    location { 'Freedom Park' }
    date { Faker::Date.between(from: 1.year.ago, to: 1.year.from_now) }
    description { 'wedding' }

    association :host, factory: :user
  end
end
