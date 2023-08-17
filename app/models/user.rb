class User < ApplicationRecord
  has_secure_password

  has_one :preference, dependent: :destroy

  validates :username, presence: true, uniqueness: true, length: { maximum: 50 }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP },
                    length: { maximum: 100 }
  validates :password, length: { minimum: 6 }, on: :create

  after_create :create_preferences

  private

  def create_preferences
    build_preference(vegetarian: false, vegan: false, gluten_free: false).save!
  end
end
