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

ActiveRecord::Schema[7.1].define(version: 2024_10_30_174901) do
  create_table "appointment_issues", force: :cascade do |t|
    t.integer "appointment_id", null: false
    t.integer "issue_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["appointment_id"], name: "index_appointment_issues_on_appointment_id"
    t.index ["issue_id"], name: "index_appointment_issues_on_issue_id"
  end

  create_table "appointments", force: :cascade do |t|
    t.datetime "date"
    t.string "doctor_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "issues", force: :cascade do |t|
    t.string "description"
    t.string "severity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_issues_on_user_id"
  end

  create_table "notes", force: :cascade do |t|
    t.integer "issue_id", null: false
    t.text "content"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "appointment_id", null: false
    t.index ["appointment_id"], name: "index_notes_on_appointment_id"
    t.index ["issue_id"], name: "index_notes_on_issue_id"
  end

  create_table "treatment_plans", force: :cascade do |t|
    t.integer "note_id", null: false
    t.text "description"
    t.string "frequency"
    t.datetime "start_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["note_id"], name: "index_treatment_plans_on_note_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "appointment_issues", "appointments"
  add_foreign_key "appointment_issues", "issues"
  add_foreign_key "appointments", "users"
  add_foreign_key "notes", "appointments"
  add_foreign_key "notes", "issues"
  add_foreign_key "treatment_plans", "notes"
end
