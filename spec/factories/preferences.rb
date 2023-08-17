# frozen_string_literal: true

FactoryBot.define do
  factory :preference do
    vegetarian { false }
    vegan { false }
    gluten_free { false }
  end
end
