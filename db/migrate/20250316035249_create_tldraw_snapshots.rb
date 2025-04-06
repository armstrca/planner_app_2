class CreateTldrawSnapshots < ActiveRecord::Migration[7.0]
  def change
    create_table :tldraw_snapshots, id: :uuid do |t|
      t.references :page, null: false, foreign_key: true, type: :uuid
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.references :planner, null: false, foreign_key: true, type: :uuid
      t.json :document_data

      t.timestamps
    end
  end
end
