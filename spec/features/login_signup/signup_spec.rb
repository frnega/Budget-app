require 'rails_helper'
RSpec.feature 'SignUp', type: :feature do
  background { visit new_user_registration_path }
  scenario 'has necessary fields' do
    expect(page).to have_field('Email')
  end
  scenario 'has necessary fields' do
    expect(page).to have_field('Full Name')
  end
  scenario 'has necessary fields' do
    expect(page).to have_field('Password(6 characters minimum)')
  end
  scenario 'has necessary fields' do
    expect(page).to have_field('Confirm Password')
  end
  scenario 'displays next button' do
    expect(page).to have_button('Next')
  end

  scenario 'has login link' do
    expect(page).to have_link('Log In')
  end
end
