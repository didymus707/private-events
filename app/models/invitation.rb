class Invitation < ApplicationRecord
  belongs_to :event
  belongs_to :event_attendee, class_name: 'User'
  belongs_to :host, class_name: 'User'
end
