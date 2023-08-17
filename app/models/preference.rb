class Preference < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :vegetarian, :vegan, :gluten_free, inclusion: { in: [true, false] }
end
