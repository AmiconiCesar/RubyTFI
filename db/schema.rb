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

ActiveRecord::Schema[7.0].define(version: 2023_02_07_005646) do
  create_table "bank_branches", force: :cascade do |t|
    t.string "name", null: false
    t.string "address", null: false
    t.string "phone", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "locality_id", null: false
    t.index ["locality_id"], name: "index_bank_branches_on_locality_id"
    t.index ["name"], name: "index_bank_branches_on_name", unique: true
  end

  create_table "localities", force: :cascade do |t|
    t.string "name", null: false
    t.string "province", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "province"], name: "index_localities_on_name_and_province", unique: true
  end

  create_table "schedules", force: :cascade do |t|
    t.integer "weekday", null: false
    t.time "start_time", null: false
    t.time "end_time", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "bank_branch_id", null: false
    t.index ["bank_branch_id"], name: "index_schedules_on_bank_branch_id"
    t.index ["weekday", "bank_branch_id"], name: "index_schedules_on_weekday_and_bank_branch_id", unique: true
  end

  create_table "turns", force: :cascade do |t|
    t.date "date", null: false
    t.time "time", null: false
    t.string "reason", null: false
    t.integer "state", null: false
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "bank_branch_id", null: false
    t.integer "user_id", null: false
    t.integer "employee_id"
    t.index ["bank_branch_id"], name: "index_turns_on_bank_branch_id"
    t.index ["employee_id"], name: "index_turns_on_employee_id"
    t.index ["user_id"], name: "index_turns_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.integer "role", default: 1, null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "bank_branch_id"
    t.index ["bank_branch_id"], name: "index_users_on_bank_branch_id"
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "bank_branches", "localities"
  add_foreign_key "schedules", "bank_branches"
  add_foreign_key "turns", "bank_branches"
  add_foreign_key "turns", "users"
  add_foreign_key "turns", "users", column: "employee_id"
  add_foreign_key "users", "bank_branches"
end
