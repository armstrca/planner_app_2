# frozen_string_literal: true

class CreatePlannerEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :planner_entries do |t|
      t.integer :user_id
      t.integer :planner_id
      t.datetime :datetime_start
      t.integer :tldraw_input_id
      t.integer :monthly_id
      t.integer :daily_id
      t.integer :weekly_id
      t.integer :extra_id
      t.string :entry_content
      t.string :location
      t.string :datetime_end

      t.timestamps
    end
  end
end
