require 'rails_helper'

RSpec.feature 'Category #Show', type: :feature do
  background do
    visit new_user_session_path

    @user = User.create(name: 'fre nega', email: 'fr.nega@gmail.com', password: '123456')
    @category = Category.create(name: 'Home', user_id: @user.id)
    @exchange = Exchange.create(name: 'Food', amount: 50, author_id: @user.id, category_ids: @category.id)
    @exchange2 = Exchange.create(name: 'Close', amount: 50, author_id: @user.id, category_ids: @category.id)

    within 'form' do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
    end
    click_button 'Log In'
    visit category_path(@category.id)
  end

  scenario 'show Categories on page' do
    expect(page).to have_content 'Transactions'
  end

  scenario 'display details of a category' do
    expect(page).to have_content(@category.name)
    expect(page).to have_content('$100')
    expect(page).not_to have_content('$0')
  end

  scenario 'display details of a category' do
    expect(page).to have_content(@exchange.name)
    expect(page).to have_content(@exchange2.name)
    expect(page).not_to have_content('car')
    expect(page).to have_content('$50')
  end

  scenario 'show Add A Category button on page' do
    expect(page).to have_link 'Add A Transactions'
  end
end
