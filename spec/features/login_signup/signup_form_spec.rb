require 'rails_helper'
RSpec.feature 'SignUp', type: :feature do
  background { visit new_user_registration_path }
  context 'Form Submission' do
    scenario 'Submit form without email' do
      within 'form' do
        fill_in 'Full Name', with: 'FRE NEGA'
        fill_in 'Password(6 characters minimum)', with: '123456'
        fill_in 'Confirm Password', with: '123456'
      end
      click_button 'Next'
      expect(page).to have_content "Email can't be blank"
    end

    scenario 'Submit form without full name' do
      within 'form' do
        fill_in 'Email', with: 'admin@admin20.com'
        fill_in 'Password(6 characters minimum)', with: '123456'
        fill_in 'Confirm Password', with: '123456'
      end
      click_button 'Next'
      expect(page).to have_content "Name can't be blank"
    end

    scenario 'Submit form without password' do
      within 'form' do
        fill_in 'Full Name', with: 'FRE NEGA'
        fill_in 'Email', with: 'admin@admin20.com'
      end
      click_button 'Next'
      expect(page).to have_content "Password can't be blank"
    end
  end
end
