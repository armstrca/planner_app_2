# frozen_string_literal: true

class CreatePlanners < ActiveRecord::Migration[7.0]
  def change
    create_table :planners do |t|
      t.integer :user_id
      t.integer :monthly_id
      t.integer :weekly_id
      t.integer :daily_id
      t.string :page_order
      t.integer :monthlies_count
      t.integer :weeklies_count
      t.integer :dailies_count
      t.integer :extras_count
      t.integer :tldraw_inputs_count

      t.timestamps
    end
  end
end
