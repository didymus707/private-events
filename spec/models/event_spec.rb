require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'Event Associations' do
    it { should belong(:host) }
    it { should have_many(:event_attendee) }
    it { should have_many(:event_attendances) }
  end
  # pending "add some examples to (or delete) #{__FILE__}"
end
