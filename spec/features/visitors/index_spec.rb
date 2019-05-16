require 'rails_helper'

RSpec.describe 'When visiting the users page' do
  describe 'it shows a list of all users' do

    before :each do
      @user_1 = User.create!(name: 'Vince', email_address: 'vincecarollo@gmail.com')
      @user_2 = User.create!(name: 'Kate', email_address: 'krjdh8@gmail.com')
    end

    it 'shows their basic attributes' do
      visit users_path

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
    # As a Visitor
    # When I visit the user index
    # And click on 'Register as User'
    # I am taken to a new user form
    # When I fill out that form and click 'Create User'
    # I am redirected back to user index
    # And see the new user

    describe 'when clicking on register as User' do
      it 'can create a new user' do
        visit users_path

        click_link "Register as User"

        expect(current_path).to eq(new_user_path)
        expect(page).to have_content("Create a User")

        fill_in :user_name, with: 'New User'
        fill_in :user_email_address, with: "newuser@gmail.com"
        click_on "Create User"

        expect(User.last.name).to eq('New User')
        expect(current_path).to eq(users_path)

        new_user = User.last

        within "#user-#{new_user.id}" do
          expect(page).to have_content("Name: #{new_user.name}")
          expect(page).to have_content("Email: #{new_user.email_address}")
        end
      end

      it 'cant create a new user with no email' do
        visit users_path

        click_link "Register as User"

        expect(current_path).to eq(new_user_path)
        expect(page).to have_content("Create a User")

        fill_in :user_name, with: 'New User'
        fill_in :user_email_address, with: ""
        click_on "Create User"

        expect(page).to have_content("Must Enter Email Address")
        expect(User.last.name).to_not eq('New User')
        expect(current_path).to eq(new_user_path)
      end

      it 'cant create the same user twice - based on email' do
        visit users_path

        click_link "Register as User"

        fill_in :user_name, with: 'Vince2'
        fill_in :user_email_address, with: @user_1.email_address
        click_on "Create User"

        expect(page).to have_content("User Already Exists")
        expect(User.last.name).to_not eq('Vince2')
        expect(current_path).to eq(new_user_path)
      end
    end
  end
end
