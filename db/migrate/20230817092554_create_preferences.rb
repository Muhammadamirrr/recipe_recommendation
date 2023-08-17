# frozen_string_literal: true

class CreatePreferences < ActiveRecord::Migration[7.0]
  def change
    create_table :preferences do |t|
      t.references :user, null: false, foreign_key: true
      t.boolean :vegetarian, default: false
      t.boolean :vegan, default: false
      t.boolean :gluten_free, default: false

      t.timestamps
    end
  end
end
