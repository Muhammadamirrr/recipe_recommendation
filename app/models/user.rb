class User < ApplicationRecord
  has_secure_password

<<<<<<< Updated upstream
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
=======
  has_one :preference, dependent: :destroy

  validates :username, presence: true, uniqueness: true, length: { maximum: 50 }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP },
                    length: { maximum: 100 }
>>>>>>> Stashed changes
  validates :password, length: { minimum: 6 }, on: :create
end
