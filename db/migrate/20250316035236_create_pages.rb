class CreatePages < ActiveRecord::Migration[7.0]
  def change
    create_table :pages, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.references :planner, null: false, foreign_key: true, type: :uuid
      t.references :page_template, null: false, foreign_key: true, type: :uuid
      t.date :page_date

      t.timestamps
    end

    recent_cutoff = Date.current - 1.year
    add_index :pages, :page_date,
              where: "page_date >= '#{recent_cutoff}'",
              name: 'index_recent_pages'
  end
end
