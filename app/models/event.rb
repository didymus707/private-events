class Event < ApplicationRecord
  validates :location, presence: true
  validates :date, presence: true
  validates :description, presence: true

  has_many :event_attendances, foreign_key: :attended_event_id
  has_many :attendees, through: :event_attendances, source: :event_attendee
  belongs_to :host, class_name: 'User'
  scope :past_events, ->(time) { where("created_at < ?", time) }
  scope :upcoming_events, ->(time) { where("created_at > ?", time) }

  # def self.past_events(time)
  #   where("created_at < ?", time)
  # end

  # def self.upcoming_events(time)
  #   where("created_at > ?", time)
  # end
end
