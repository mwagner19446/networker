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

ActiveRecord::Schema.define(version: 20140226001537) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "connections", force: true do |t|
    t.string  "name"
    t.string  "c_type"
    t.integer "user_id"
    t.integer "liuser_id"
    t.text    "photo_url", default: ""
  end

  create_table "liusers", force: true do |t|
    t.string "linkedin_id"
    t.string "first_name"
    t.string "last_name"
    t.string "headline"
    t.string "industry"
    t.string "picture_url"
  end

  create_table "tasks", force: true do |t|
    t.string   "title"
    t.string   "t_type"
    t.string   "notes"
    t.integer  "user_id"
    t.datetime "due_date"
  end

  create_table "tokens", force: true do |t|
    t.string   "expires_in"
    t.text     "access_token"
    t.integer  "user_id"
    t.datetime "access_date"
  end

  create_table "users", force: true do |t|
    t.string  "name"
    t.string  "title"
    t.text    "photo_url",       default: ""
    t.text    "email"
    t.string  "password_digest"
    t.boolean "superuser",       default: false
  end

end
