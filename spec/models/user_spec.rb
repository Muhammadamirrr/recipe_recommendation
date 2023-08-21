# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should allow_value('user@example.com').for(:email) }
    it { should_not allow_value('invalid_email').for(:email) }
    it { should validate_length_of(:password).is_at_least(6).on(:create) }
  end

  describe 'associations' do
    it { should have_one(:preference).dependent(:destroy) }
  end

  describe 'password encryption' do
    it 'encrypts the password' do
      user = create(:user, password: 'password123')
      expect(user.authenticate('password123')).to eq(user)
      expect(user.authenticate('wrongpassword')).to eq(false)
    end
  end

  describe 'callbacks' do
    it 'creates preferences after user creation' do
      user = build(:user)
      expect(user.preference).to be_nil
      user.save
      expect(user.preference).to be_present
    end
  end
end
