require 'rails_helper'

RSpec.describe 'when trying to visit the secret page' do

  before :each do
    user = User.create!(name: 'vince', email_address: 'vincecarollo@gmail.com', password: '1234')
  end

  describe 'while not logged in' do

    it 'returns to the login screen' do
      visit users_path

      click_link "Secret Page"

      expect(page).to have_content('Secret Page Requires Login')
      expect(current_path).to eq(login_path)
    end

  end

  describe 'while logged in' do

    it 'allows access to secret page' do
      visit login_path

      fill_in :email_address, with: 'vincecarollo@gmail.com'
      fill_in :password, with: '1234'

      click_button "Log Me In!"

      click_link "Secret Page"

      expect(current_path).to eq('/secret')
    end

  end
end
