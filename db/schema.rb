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

ActiveRecord::Schema.define(version: 20170503231336) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boardcategories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "boardposts", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.integer  "boardcategory_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.float    "distance"
    t.index ["boardcategory_id"], name: "index_boardposts_on_boardcategory_id", using: :btree
    t.index ["user_id"], name: "index_boardposts_on_user_id", using: :btree
  end

  create_table "connections", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "connected_user_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["connected_user_id"], name: "index_connections_on_connected_user_id", using: :btree
    t.index ["user_id", "connected_user_id"], name: "index_connections_on_user_id_and_connected_user_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_connections_on_user_id", using: :btree
  end

  create_table "conversations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "event_name",                           null: false
    t.date     "event_date",                           null: false
    t.time     "event_starttime",                      null: false
    t.time     "event_end_time",                       null: false
    t.string   "host_string",                          null: false
    t.string   "event_street_address",                 null: false
    t.string   "event_city",                           null: false
    t.string   "event_state",                          null: false
    t.integer  "event_zip",                            null: false
    t.boolean  "public_event",         default: false
    t.integer  "host_id",                              null: false
    t.integer  "attendee_id"
    t.integer  "invitee_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.index ["attendee_id"], name: "index_events_on_attendee_id", using: :btree
    t.index ["host_id"], name: "index_events_on_host_id", using: :btree
    t.index ["invitee_id"], name: "index_events_on_invitee_id", using: :btree
  end

  create_table "locations", force: :cascade do |t|
    t.string   "title"
    t.text     "address"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text     "content"
    t.integer  "conversation_id"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "post_tags", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_conversations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "conversation_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "lkp"
  end

  create_table "useraudiofiles", force: :cascade do |t|
    t.string   "media_file_name"
    t.string   "media_content_type"
    t.integer  "media_file_size"
    t.datetime "media_updated_at"
    t.integer  "user_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["user_id"], name: "index_useraudiofiles_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.string   "location"
    t.string   "genre"
    t.text     "music_links"
    t.string   "band_status"
    t.string   "slogan"
    t.text     "bio"
    t.text     "experience"
    t.string   "instruments"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.boolean  "band?",                  default: false, null: false
    t.boolean  "venue?",                 default: false, null: false
    t.boolean  "musician?",              default: false, null: false
    t.float    "distance"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "connections", "users"
  add_foreign_key "connections", "users", column: "connected_user_id"
  add_foreign_key "locations", "users"
  add_foreign_key "useraudiofiles", "users"
end
