# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    username { 'username' }
    email { Faker::Internet.email }
    password { 'password123' }
  end
end
