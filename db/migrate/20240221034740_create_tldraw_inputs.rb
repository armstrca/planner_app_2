class CreateTldrawInputs < ActiveRecord::Migration[7.0]
  def change
    create_table :tldraw_inputs do |t|
      t.integer :user_id
      t.integer :planner_id

      t.timestamps
    end
  end
end
