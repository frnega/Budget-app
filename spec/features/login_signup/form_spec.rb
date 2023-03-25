require 'rails_helper'
RSpec.feature 'Logins', type: :feature do
  background { visit new_user_session_path }

  context 'Form Submission' do
    scenario 'Submit form without email and password' do
      click_button 'Log In'
      expect(page).to have_content 'Invalid Email or password.'
    end

    scenario 'Submit form with incorrect email and password' do
      within 'form' do
        fill_in 'Email', with: 'newmail@gmail.com'
        fill_in 'Password', with: '123456'
      end
      click_button 'Log In'
      expect(page).to have_content 'Invalid Email or password.'
    end

    scenario 'Submit form with correct email and password' do
      @user = User.create(name: 'Dammy', email: 'admin@gmail.com', password: 'password')
      within 'form' do
        fill_in 'Email', with: @user.email
        fill_in 'Password', with: @user.password
      end
      click_button 'Log In'
      expect(page).to have_current_path(authenticated_root_path)
      expect(page).to have_content 'Signed in successfully.'
    end
  end
end
