class CreateExtras < ActiveRecord::Migration[7.0]
  def change
    create_table :extras do |t|
      t.integer :planner_id
      t.string :html

      t.timestamps
    end
  end
end
