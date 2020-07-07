# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_07_222132) do

  create_table "event_attendances", force: :cascade do |t|
    t.integer "attended_event_id"
    t.integer "event_attendee_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["attended_event_id"], name: "index_event_attendances_on_attended_event_id"
    t.index ["event_attendee_id"], name: "index_event_attendances_on_event_attendee_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "location"
    t.datetime "date"
    t.integer "host_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "description"
    t.index ["host_id"], name: "index_events_on_host_id"
  end

  create_table "invitations", force: :cascade do |t|
    t.integer "event_id", null: false
    t.integer "guest_id"
    t.integer "anchor_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["anchor_id"], name: "index_invitations_on_anchor_id"
    t.index ["event_id"], name: "index_invitations_on_event_id"
    t.index ["guest_id"], name: "index_invitations_on_guest_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "event_attendances", "events", column: "attended_event_id"
  add_foreign_key "event_attendances", "users", column: "event_attendee_id"
  add_foreign_key "events", "users", column: "host_id"
  add_foreign_key "invitations", "events"
  add_foreign_key "invitations", "users", column: "anchor_id"
  add_foreign_key "invitations", "users", column: "guest_id"
end
