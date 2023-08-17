# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RecipesController, type: :controller do
  describe 'GET #index' do
    context 'when user is logged in' do
      let(:user) { create(:user) }
      let(:api_response) do
        [
          { "id": 782_585, "title": 'Cannellini Bean and Asparagus Salad with Mushrooms', "image": 'spec/fixtures/rice.jpg',
            "imageType": 'jpg' }, { "id": 716_426, "title": 'Cauliflower, Brown Rice, and Vegetable Fried Rice', "image": 'spec/fixtures/rice.jpg', "imageType": 'jpg' }
        ]
      end

      before do
        allow(controller).to receive(:current_user).and_return(user)
        allow(controller).to receive(:require_login)
        allow(SpoonacularService).to receive(:fetch_recipes).and_return(api_response)
      end

      it 'renders the index template' do
        get :index
        expect(response).to render_template(:index)
      end

      it 'assigns @preferences' do
        get :index
        expect(assigns(:preferences)).to eq(user.preference)
      end

      it 'assigns @recipes' do
        get :index
        expect(assigns(:recipes)).to eq(api_response)
      end
    end

    context 'when user is not logged in' do
      it 'redirects to new session path' do
        get :index
        expect(response).to redirect_to(new_session_path)
      end
    end
  end

  describe 'GET #show' do
    let(:recipe_id) { '1' }

    before do
      allow(SpoonacularService).to receive(:fetch_recipe).and_return({ "id": 1,
                                                                       "title": 'Cannellini Bean and Asparagus Salad with Mushrooms', "image": 'spec/fixtures/rice.jpg', "imageType": 'jpg' })
    end
  end
end
