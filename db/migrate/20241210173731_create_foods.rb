# frozen_string_literal: true

# This is a top level comment
class CreateFoods < ActiveRecord::Migration[8.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :notes

      t.timestamps
    end
  end
end
