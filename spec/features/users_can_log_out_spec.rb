require 'rails_helper'


RSpec.describe 'when viewing all users' do

  describe 'when clicking on log out button while loggin in' do

    it 'can log a user out' do
      User.create!(name: 'vince', email_address: 'vincecarollo@gmail.com', password: '12345')

      visit login_path

      fill_in :email_address, with: 'vincecarollo@gmail.com'
      fill_in :password, with: '12345'

      click_button "Log Me In!"

      click_link "Log Out"

      expect(current_path).to eq(users_path)
      expect(page).to have_content("Log In")
      expect(page).to_not have_content("Log Out")
    end

  end

end
