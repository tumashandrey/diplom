# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20190531220317) do

  create_table "railway_stations", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "railway_stations_trains", force: :cascade do |t|
    t.integer  "railway_station_id"
    t.integer  "train_id"
    t.integer  "position"
    t.datetime "time"
  end

  create_table "routes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "train_id"
    t.decimal  "seat_price"
    t.decimal  "second_place_price"
    t.decimal  "coupe_price"
  end

  create_table "tickets", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "route_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "seats_type"
  end

  create_table "trains", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "train_type"
    t.integer  "seat_capacity"
    t.integer  "second_place_capacity"
    t.integer  "coupe_capacity"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",              default: "",    null: false
    t.string   "encrypted_password", default: "",    null: false
    t.boolean  "admin",              default: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "phone_number"
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
