class Event < ApplicationRecord
  validates :location, presence: true
  validates :date, presence: true
  validates :description, presence: true

  has_many :event_attendances, foreign_key: :event_attended_id
  has_many :attendees, through: :event_attendances, source: :event_attendee
  belongs_to :host, class_name: 'User'
end
