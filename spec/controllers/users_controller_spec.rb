# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #new' do
    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end

    it 'assigns a new user' do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      let(:valid_attributes) do
        {
          user: {
            username: 'testuser',
            email: 'test@example.com',
            password: 'password123',
            password_confirmation: 'password123'
          }
        }
      end

      it 'creates a new user' do
        expect do
          post :create, params: valid_attributes
        end.to change(User, :count).by(1)
      end

      it 'logs in the user' do
        post :create, params: valid_attributes
        expect(session[:user_id]).to eq(User.last.id)
      end

      it 'redirects to root_path' do
        post :create, params: valid_attributes
        expect(response).to redirect_to(root_path)
      end
    end

    context 'with invalid attributes' do
      let(:invalid_attributes) do
        {
          user: {
            username: '',
            email: 'invalid-email',
            password: 'short',
            password_confirmation: 'mismatch'
          }
        }
      end

      it 'does not create a new user' do
        expect do
          post :create, params: invalid_attributes
        end.not_to change(User, :count)
      end

      it 'renders the new template' do
        post :create, params: invalid_attributes
        expect(response).to render_template(:new)
      end
    end
  end
end
