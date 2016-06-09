ActiveRecord::Schema.define(version: 20160609153613) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "crags", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "directions"
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
