require 'rails_helper'

RSpec.describe Event, type: :model do
  
  describe 'Event Associations' do
    it { should belong_to(:host) }
    it { should have_many(:event_attendees) }
    it { should have_many(:event_attendances) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:location) }
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:description) }
  end


  # pending "add some examples to (or delete) #{__FILE__}"
end
