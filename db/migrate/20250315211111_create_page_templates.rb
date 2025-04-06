class CreatePageTemplates < ActiveRecord::Migration[7.0]
  def change
    create_table :page_templates, id: :uuid do |t|
      t.string :name
      t.json :content
      t.string :type, null: false
      t.boolean :is_default, null: false, default: false
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.references :planner, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
