require 'rails_helper'

RSpec.feature 'Recipe Search', type: :feature do
  scenario 'user can search for recipes and view search results' do
    user = create(:user, email: 'user@example.com', password: 'password123')

    login_user(user)
    visit recipes_path

    fill_in 'Search recipes', with: 'rice'
    click_button 'Search'

    expect(page).to have_content('Rice Cannellini Bean and Asparagus Salad with Mushrooms')
    expect(page).to have_content('Rice Cauliflower, Brown Rice, and Vegetable Fried Rice')

    click_link 'View Recipe', match: :first

    expect(page).to have_content('Cannellini Bean and Asparagus Salad with Mushrooms')
  end
end
