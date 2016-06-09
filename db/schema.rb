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

ActiveRecord::Schema.define(version: 20160609220428) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "crags", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "directions"
    t.string "location"
  end

  create_table "panoramas", force: :cascade do |t|
    t.string  "location"
    t.integer "user_id"
    t.string  "thumbnail"
    t.integer "crag_id"
  end

  add_index "panoramas", ["crag_id"], name: "index_panoramas_on_crag_id", using: :btree
  add_index "panoramas", ["user_id"], name: "index_panoramas_on_user_id", using: :btree

  create_table "routes", force: :cascade do |t|
    t.string   "name"
    t.string   "grade"
    t.string   "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "crag_id"
  end

  add_index "routes", ["crag_id"], name: "index_routes_on_crag_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "profile_image"
  end

  add_foreign_key "panoramas", "crags"
  add_foreign_key "panoramas", "users"
  add_foreign_key "routes", "crags"
end
