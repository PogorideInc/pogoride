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

ActiveRecord::Schema.define(version: 20140218233605) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ride_requests", force: true do |t|
    t.integer  "ride_id"
    t.integer  "passenger_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "status_code",   limit: 2
    t.integer  "message_id"
    t.datetime "date_modified"
  end

  create_table "rides", force: true do |t|
    t.string   "from"
    t.string   "to"
    t.date     "ride_date"
    t.integer  "no_of_seats"
    t.integer  "no_booked_seats"
    t.text     "description"
    t.integer  "donation_amt"
    t.boolean  "luggage_space"
    t.boolean  "ski_rack"
    t.boolean  "bike_rack"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.time     "ride_time"
    t.integer  "driver_id"
  end

  add_index "rides", ["user_id"], name: "index_rides_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.string   "email"
    t.text     "about_me"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
