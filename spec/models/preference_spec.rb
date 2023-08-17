# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Preference, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:user_id) }
    it { should validate_inclusion_of(:vegetarian).in_array([true, false]) }
    it { should validate_inclusion_of(:vegan).in_array([true, false]) }
    it { should validate_inclusion_of(:gluten_free).in_array([true, false]) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
  end
end
