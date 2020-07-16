class Event < ApplicationRecord
  validates :location, presence: true
  validates :date, presence: true
  validates :description, presence: true

  has_many :event_attendances, foreign_key: :attended_event_id
  has_many :event_attendees, through: :event_attendances, source: :event_attendee
  belongs_to :host, foreign_key: :host_id, class_name: 'User'
  scope :past_events, ->(time) { where('date < ?', time) }
  scope :upcoming_events, ->(time) { where('date > ?', time) }

  # def self.past_events(time)
  #   where("date < ?", time)
  # end

  # def self.upcoming_events(time)
  #   where("date > ?", time)
  # end
end
