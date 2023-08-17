# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
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
