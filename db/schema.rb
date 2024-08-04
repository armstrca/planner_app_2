# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_240_221_034_740) do
  create_table 'dailies', force: :cascade do |t|
    t.integer 'planner_id'
    t.string 'html'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'extras', force: :cascade do |t|
    t.integer 'planner_id'
    t.string 'html'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'monthlies', force: :cascade do |t|
    t.integer 'planner_id'
    t.string 'html'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'planners', force: :cascade do |t|
    t.integer 'user_id'
    t.integer 'monthly_id'
    t.integer 'weekly_id'
    t.integer 'daily_id'
    t.string 'page_order'
    t.integer 'monthlies_count'
    t.integer 'weeklies_count'
    t.integer 'dailies_count'
    t.integer 'extras_count'
    t.integer 'tldraw_inputs_count'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'tldraw_inputs', force: :cascade do |t|
    t.integer 'user_id'
    t.integer 'planner_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.string 'avatar'
    t.integer 'planner_id'
    t.integer 'planners_count'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  create_table 'weeklies', force: :cascade do |t|
    t.integer 'planner_id'
    t.string 'html'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end
end
