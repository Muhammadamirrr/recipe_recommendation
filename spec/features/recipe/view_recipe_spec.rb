require 'rails_helper'

RSpec.feature 'View Recipe Details', type: :feature do
  scenario 'user can view recipe details' do
    user = create(:user, email: 'user@example.com', password: 'password123')

    login_user(user)

    visit recipe_path(1)
    expect(page).to have_css("img[src='spec/fixtures/rice.jpg']")
    expect(page).to have_content('Cannellini Bean and Asparagus Salad with Mushrooms')
    expect(page).to have_content('Ingredient 1')
    expect(page).to have_content('Ingredient 2')
    expect(page).to have_content('Instructions for the recipe.')
  end
end
