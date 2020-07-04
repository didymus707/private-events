class User < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2 }
  validates :email, presence: true, uniqueness: true

  before_save { self.name = name.capitalize }

  has_many :event_attendances, foreign_key: :event_attendee_id
  has_many :attended_events, through: :event_attendances
  has_many :hosted_events, foreign_key: :host_id, class_name: 'Event'

  has_many :guests, class_name: 'User', foreign_key: 'anchor_id'
  belongs_to :anchor, class_name: 'User', optional: true
end
