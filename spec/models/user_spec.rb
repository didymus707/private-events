require 'rails_helper'

RSpec.describe User, type: :model do
  let(:new_user) { create(:user) }

  describe 'Associations' do
    it { should have_many(:hosted_events) }
    it { should have_many(:attended_events) }
    it { should have_many(:event_attendances) }
  end

  describe 'Validations' do
    it 'should have a name' do
      expect(new_user).to be_valid
    end

    it 'should be invalid without name' do
      new_user.name = nil
      new_user.email = 'nil@example.com'

      expect(new_user).not_to be_valid
    end

    it 'should be invalid without email' do
      new_user.name = nil
      new_user.email = nil

      expect(new_user).not_to be_valid
    end
  end

  # pending "add some examples to (or delete) #{__FILE__}"
end
