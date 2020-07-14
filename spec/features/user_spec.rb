require 'rails_helper'

RSpec.describe 'Users' do
  let(:returning_user) { FactoryBot.create(:user) }
  let(:new_event) { FactoryBot.create(:event) }

  def new_user
    { name: Faker::Name.name, email: Faker::Internet.email }
  end

  def event
    {
      name: Faker::Address.building_number,
      date: Faker::Date.between(from: 1.year.ago, to: 1.year.from_now),
      description: Faker::Lorem.sentence
    }
  end

  def sign_up(new_user)
    within '.column' do
      fill_in 'user[name]', with: new_user[name]
      fill_in 'user[email]', with: new_user[email]

      click_button 'Sign up'
    end
  end

  def sign_in(user)
    vist new_sessions_path
    within '.column' do
      fill_in 'user_name', with: user.name

      click_button 'Log in'
    end
  end

  def create_events(event)
    visit new_events_path

    within '.column' do
      fill_in 'event_description', with: event[description]
      fill_in 'event_location', with: event[location]
      fill_in 'event_date', with: event[date]

      click_button 'Create Event'
    end
  end

  def manage_events(user, event)
    visit attend_path

    within '.column' do
      fill_in 'event_attendance_id', with: event[description]
      fill_in 'event_attendee_id', with: user.name
    end
  end
end
