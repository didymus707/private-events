class EventAttendance < ApplicationRecord
  belongs_to :event_attendee, class_name: 'Event'
  belongs_to :attended_event, class_name: 'User'
end
