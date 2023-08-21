require 'rails_helper'

RSpec.feature 'User Registration', type: :feature do
  scenario 'user can create an account with valid information' do
    visit new_user_path

    fill_in 'Username', with: 'testuser'
    fill_in 'Email', with: 'test@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'

    click_button 'Register'

    expect(page).to have_content('Successfully registered and logged in.')
  end

  scenario 'user sees error messages with invalid information' do
    visit new_user_path

    click_button 'Register'

    expect(page).to have_content("Username can't be blank")
    expect(page).to have_content("Email can't be blank")
    expect(page).to have_content("Password can't be blank")
    expect(page).to have_content('Password is too short (minimum is 6 characters)')
  end
end
