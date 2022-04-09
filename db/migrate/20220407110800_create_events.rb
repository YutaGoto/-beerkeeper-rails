# frozen_string_literal: true

class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.integer :max_size
      t.string :budget
      t.text :description
      t.datetime :start_at
      t.datetime :end_at
      t.references :organizer, foreign_key: { to_table: :users }, null: false

      t.timestamps
    end
  end
end
