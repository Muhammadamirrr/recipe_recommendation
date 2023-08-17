# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username, null: false, unique: true, limit: 50
      t.string :email, null: false, unique: true, limit: 100, format: { with: URI::MailTo::EMAIL_REGEXP }
      t.string :password_digest

      t.timestamps
    end
  end
end
