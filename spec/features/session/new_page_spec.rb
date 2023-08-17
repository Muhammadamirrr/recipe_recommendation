require 'rails_helper'

RSpec.feature 'User Login', type: :feature do
  scenario 'user can log in with valid credentials' do
    user = create(:user, email: 'user@example.com', password: 'password123')

    visit new_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log In'

    expect(current_path).to eq(root_path)
    expect(page).to have_content('Successfully logged in.')
  end

  scenario 'user cannot log in with invalid credentials' do
    visit new_session_path

    fill_in 'Email', with: 'invalid@example.com'
    fill_in 'Password', with: 'wrongpassword'
    click_button 'Log In'

    expect(current_path).to eq(sessions_path)
    expect(page).to have_content('Invalid email or password.')
  end
end
