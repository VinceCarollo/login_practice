require 'rails_helper'

# As a visitor
# I visit '/login'
# When I fill in a form with an existing user's email and password
# And click 'Log Me In!'
# I am redirected to the users index
# And I see a message saying 'Welcome <user name>, you are logged in!'
# And I do not see a link to 'Log In'

RSpec.describe 'when on the login page' do

  before :each do
    @user = User.create!(name: 'vince', email_address: 'vincecarollo@gmail.com', password: '1234')
  end

  describe 'it shows a form to log me in' do

    it 'lets me login with existing user info' do
      visit login_path

      fill_in :email_address, with: 'vincecarollo@gmail.com'
      fill_in :password, with: '1234'
      click_on "Log Me In!"

      expect(current_path).to eq(users_path)
      expect(page).to have_content("Welcome #{@user.name}, you are logged in!")
      expect(page).to_not have_content("Log In")
    end

    it 'lets me login with upcased email' do
      visit login_path

      fill_in :email_address, with: 'ViNCEcArollo@gMAIL.com'
      fill_in :password, with: '1234'
      click_on "Log Me In!"

      expect(current_path).to eq(users_path)
      expect(page).to have_content("Welcome #{@user.name}, you are logged in!")
      expect(page).to_not have_content("Log In")
    end

    it "doesn't let me login with the wrong password or email" do
      visit login_path

      fill_in :email_address, with: 'vincecarollo@gmail.com'
      fill_in :password, with: '12345'
      click_on "Log Me In!"

      expect(current_path).to eq(login_path)
      expect(page).to have_content("Invalid email/password combination")

      visit login_path

      fill_in :email_address, with: 'carollo@gmail.com'
      fill_in :password, with: '1234'
      click_on "Log Me In!"

      expect(current_path).to eq(login_path)
      expect(page).to have_content("Invalid email/password combination")
    end

  end
end
