class Event < ApplicationRecord
  validates :location, presence: true
  # has_many :event_attendees, foreign_key: :event_attended_id
  # has_many :attendees, through: :event_attendees, source: :event_attendee
  belongs_to :host, class_name: 'User'
end
