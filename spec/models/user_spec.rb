require 'rails_helper'

RSpec.describe User, type: :model do

  let (:new_user) { FactoryBot.build(:user) }

  describe 'User Associations' do
    it { should have_many(:hosted_events) }
    it { should have_many(:attended_events) }
    it { should have_many(:event_attendances) }
  end

  describe 'User Validations' do
    it 'should have a name and an email' do
      expect(new_user).to be_valid
    end

    it 'should be invalid without name' do
      new_user.name = ''
      expect(new_user).not_to be_valid
    end

    it 'should be invalid without email' do
      new_user.email = ''
      expect(new_user).not_to be_valid
    end

    it 'should be a valid email' do
      new_user.email = 'jidjd.com'
      expect(new_user).not_to be_valid
    end
  end

  # pending "add some examples to (or delete) #{__FILE__}"
end
