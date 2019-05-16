require 'rails_helper'

RSpec.describe 'When visiting the users page' do
  describe 'it shows a list of all users' do

    before :each do
      @user_1 = User.create!(name: 'Vince', email_address: 'vincecarollo@gmail.com')
      @user_2 = User.create!(name: 'Kate', email_address: 'krjdh8@gmail.com')
    end

    it 'shows their basic attributes' do
      visit users_path
      save_and_open_page
      expect(page).to have_content("All Users")

      within "#user-#{@user_1.id}" do
        expect(page).to have_content("Name: #{@user_1.name}")
        expect(page).to have_content("Email: #{@user_1.email_address}")
      end

      within "#user-#{@user_2.id}" do
        expect(page).to have_content("Name: #{@user_2.name}")
        expect(page).to have_content("Email: #{@user_2.email_address}")
      end

    end
  end
end
