# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  describe 'before_action :require_login' do
    context 'when user is logged in' do
      let(:user) { create(:user) }

      before do
        session[:user_id] = user.id
        get :index
      end

      it 'does not set flash message' do
        expect(flash[:notice]).to be_nil
      end

      it 'sets @current_user' do
        expect(assigns(:current_user)).to eq(user)
      end
    end

    context 'when user is not logged in' do
      before do
        session[:user_id] = nil
        get :index
      end

      it 'sets flash message' do
        expect(flash[:notice]).to eq('You must be logged in to access this page.')
      end

      it 'redirects to new session path' do
        expect(response).to redirect_to(new_session_path)
      end
    end
  end

  describe '#current_user' do
    context 'when user is logged in' do
      let(:user) { create(:user) }

      before do
        session[:user_id] = user.id
      end

      it 'returns the current user' do
        expect(controller.send(:current_user)).to eq(user)
      end
    end

    context 'when user is not logged in' do
      it 'returns nil' do
        expect(controller.send(:current_user)).to be_nil
      end
    end
  end
end
