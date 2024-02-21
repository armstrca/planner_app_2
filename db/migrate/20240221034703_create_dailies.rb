class CreateDailies < ActiveRecord::Migration[7.0]
  def change
    create_table :dailies do |t|
      t.integer :planner_id
      t.string :html

      t.timestamps
    end
  end
end
