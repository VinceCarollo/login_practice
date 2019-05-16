require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :email_address }

  describe 'instance methods' do
    it '.exists?' do
      user_1 = User.create!(name: 'vince', email_address: 'vincecarollo@gmail.com')
      user_2 = User.new(name: 'vince', email_address: 'vincecarollo@gmail.com')
      user_3 = User.new(name: 'vince', email_address: 'different@gmail.com')


      expect(user_2.user_exists?).to be true
      expect(user_3.user_exists?).to be false
    end
  end
end
