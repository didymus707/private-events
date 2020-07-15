FactoryBot.define do
  factory :user, aliases: [:host, :event_attendee] do
    name { 'Joe' }
    email { "#{name}@email.com" }

    association :hosted_events, factory: :event
  end
end
