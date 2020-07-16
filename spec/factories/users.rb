FactoryBot.define do
  factory :user, aliases: %i[host event_attendee] do
    name { 'Joe' }
    email { "#{name}@email.com" }
  end
end
