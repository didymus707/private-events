require 'rails_helper'

RSpec.describe EventAttendance, type: :model do

  describe 'Associations' do
    it { should belong_to(:event_attendee) }
    it { should belong_to(:attended_event) }
  end
  # pending "add some examples to (or delete) #{__FILE__}"
end
