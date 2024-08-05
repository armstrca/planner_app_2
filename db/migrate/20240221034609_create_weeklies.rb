# frozen_string_literal: true

class CreateWeeklies < ActiveRecord::Migration[7.0]
  def change
    create_table :weeklies do |t|
      t.integer :planner_id
      t.string :html

      t.timestamps
    end
  end
end
