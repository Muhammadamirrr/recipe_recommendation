# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'GET #new' do
    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    context 'with valid credentials' do
      let(:user) { create(:user, email: 'test@example.com', password: 'password123') }
      let(:valid_attributes) do
        { email: user.email, password: 'password123' }
      end

      it 'logs in the user' do
        post :create, params: valid_attributes
        expect(session[:user_id]).to eq(user.id)
      end

      it 'redirects to root_path' do
        post :create, params: valid_attributes
        expect(response).to redirect_to(root_path)
      end

      it 'sets flash success message' do
        post :create, params: valid_attributes
        expect(flash[:success]).to eq('Successfully logged in.')
      end
    end

    context 'with invalid credentials' do
      let(:invalid_attributes) do
        { email: 'invalid@example.com', password: 'invalidpassword' }
      end

      it 'does not log in the user' do
        post :create, params: invalid_attributes
        expect(session[:user_id]).to be_nil
      end

      it 'renders the new template' do
        post :create, params: invalid_attributes
        expect(response).to render_template(:new)
      end

      it 'sets flash danger message' do
        post :create, params: invalid_attributes
        expect(flash[:danger]).to eq('Invalid email or password.')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'logs out the user' do
      session[:user_id] = create(:user).id
      delete :destroy
      expect(session[:user_id]).to be_nil
    end

    it 'redirects to root_path' do
      delete :destroy
      expect(response).to redirect_to(new_session_path)
    end

    it 'sets flash success message' do
      delete :destroy
      expect(flash[:notice]).to eq('You must be logged in to access this page.')
    end
  end
end
