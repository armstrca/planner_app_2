# frozen_string_literal: true

class CreateMonthlies < ActiveRecord::Migration[7.0]
  def change
    create_table :monthlies do |t|
      t.integer :planner_id
      t.string :html

      t.timestamps
    end
  end
end
