require 'rails_helper'

RSpec.feature 'Update Preferences', type: :feature do
  let!(:user) { create(:user) }
  let!(:preference) { create(:preference, user:) }

  before do
    login_user(user)
    visit preferences_path
  end

  scenario 'user can update preferences with valid information' do
    check 'Vegetarian'
    check 'Vegan'
    check 'Gluten free'

    click_button 'Update Preferences'

    expect(page).to have_content('Preferences updated successfully.')
  end
end
