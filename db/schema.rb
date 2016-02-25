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

ActiveRecord::Schema.define(version: 20160225181749) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "arts", force: :cascade do |t|
    t.string   "name"
    t.string   "style"
    t.integer  "price"
    t.string   "details"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "user_id"
  end

  add_index "arts", ["user_id"], name: "index_arts_on_user_id", using: :btree

  create_table "follows", force: :cascade do |t|
    t.integer  "followable_id",                   null: false
    t.string   "followable_type",                 null: false
    t.integer  "follower_id",                     null: false
    t.string   "follower_type",                   null: false
    t.boolean  "blocked",         default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "follows", ["followable_id", "followable_type"], name: "fk_followables", using: :btree
  add_index "follows", ["follower_id", "follower_type"], name: "fk_follows", using: :btree

  create_table "likes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "art_id"
  end

  add_index "likes", ["art_id"], name: "index_likes_on_art_id", using: :btree
  add_index "likes", ["user_id"], name: "index_likes_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "first"
    t.string   "last"
    t.integer  "age"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_foreign_key "arts", "users"
  add_foreign_key "likes", "arts"
  add_foreign_key "likes", "users"
end
