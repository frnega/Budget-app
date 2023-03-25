require 'rails_helper'
RSpec.feature 'Logins', type: :feature do
  background { visit new_user_session_path }
  scenario 'displays email field' do
    expect(page).to have_field('user[email]')
  end

  scenario 'displays password field' do
    expect(page).to have_field('user[password]')
  end

  scenario 'displays login button' do
    expect(page).to have_button('Log In')
  end

  scenario 'has sign up link' do
    expect(page).to have_link('Sign Up')
  end
end
