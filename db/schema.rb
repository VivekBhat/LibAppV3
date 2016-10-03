# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161003043138) do

  create_table "adminpages", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "booking_histroys", force: :cascade do |t|
    t.time     "from"
    t.time     "to"
    t.date     "date"
    t.integer  "rooms_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rooms_id"], name: "index_booking_histroys_on_rooms_id"
  end

  create_table "booking_histroys_rooms", force: :cascade do |t|
    t.integer "booking_histroy_id"
    t.integer "room_id"
    t.index ["booking_histroy_id", "room_id"], name: "index_booking_histroys_rooms_on_booking_histroy_id_and_room_id", unique: true
    t.index ["booking_histroy_id"], name: "index_booking_histroys_rooms_on_booking_histroy_id"
    t.index ["room_id"], name: "index_booking_histroys_rooms_on_room_id"
  end

  create_table "reservation_histroys", force: :cascade do |t|
    t.time     "from"
    t.time     "to"
    t.date     "date"
    t.integer  "rooms_id"
    t.integer  "users_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.integer  "roomnumber"
    t.string   "size"
    t.string   "status"
    t.string   "building"
    t.date     "date"
    t.time     "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "searches", force: :cascade do |t|
    t.integer  "roomnumber"
    t.string   "size"
    t.string   "status"
    t.string   "building"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "ornot"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
