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

ActiveRecord::Schema.define(version: 20140325171921) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "messages", force: true do |t|
    t.integer  "from_user"
    t.integer  "to_user"
    t.integer  "ride_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "message_text"
  end

  add_index "messages", ["ride_id"], name: "index_messages_on_ride_id", using: :btree

  create_table "passengers", force: true do |t|
    t.integer  "user_id"
    t.integer  "ride_id"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "passengers", ["ride_id"], name: "index_passengers_on_ride_id", using: :btree
  add_index "passengers", ["state"], name: "index_passengers_on_state", using: :btree
  add_index "passengers", ["user_id"], name: "index_passengers_on_user_id", using: :btree

  create_table "reviews", force: true do |t|
    t.integer  "rating"
    t.text     "content"
    t.string   "author"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "for_user_id"
  end

  add_index "reviews", ["for_user_id"], name: "index_reviews_on_for_user_id", using: :btree
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id", using: :btree

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
    t.string   "state"
    t.integer  "request_id"
  end

  add_index "rides", ["state"], name: "index_rides_on_state", using: :btree
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
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

end
