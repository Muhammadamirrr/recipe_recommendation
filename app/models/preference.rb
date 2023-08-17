class Preference < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :vegetarian, inclusion: { in: [true, false] }
  validates :vegan, inclusion: { in: [true, false] }
  validates :gluten_free, inclusion: { in: [true, false] }
end
