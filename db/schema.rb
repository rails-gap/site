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

ActiveRecord::Schema.define(version: 20160825034759) do

  create_table "memberships", force: :cascade do |t|
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "user_id",     limit: 4
    t.integer  "practice_id", limit: 4
    t.boolean  "lead",                  default: false
  end

  create_table "positions", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "practices", force: :cascade do |t|
    t.string   "name",             limit: 255
    t.string   "description",      limit: 255
    t.string   "icon",             limit: 255
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.boolean  "active",                       default: true
    t.integer  "practice_lead_id", limit: 4
  end

  create_table "roles", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rop_courses", force: :cascade do |t|
    t.string   "code",       limit: 255
    t.boolean  "active",                 default: true
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "royce_connector", force: :cascade do |t|
    t.integer  "roleable_id",   limit: 4,   null: false
    t.string   "roleable_type", limit: 255, null: false
    t.integer  "role_id",       limit: 4,   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "royce_connector", ["role_id"], name: "index_royce_connector_on_role_id", using: :btree
  add_index "royce_connector", ["roleable_id", "roleable_type"], name: "index_royce_connector_on_roleable_id_and_roleable_type", using: :btree

  create_table "royce_role", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "royce_role", ["name"], name: "index_royce_role_on_name", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",   null: false
    t.string   "encrypted_password",     limit: 255, default: "",   null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "provider",               limit: 255
    t.string   "uid",                    limit: 255
    t.string   "name",                   limit: 255
    t.string   "last_name",              limit: 255
    t.string   "employee_type",          limit: 255
    t.string   "location",               limit: 255
    t.string   "picture",                limit: 255
    t.string   "image",                  limit: 255
    t.boolean  "active",                             default: true
    t.integer  "personnel_manager_id",   limit: 4
    t.integer  "position_id",            limit: 4
    t.string   "level",                  limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "videos", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.integer  "practice_id", limit: 4
    t.string   "name",        limit: 255
    t.string   "url",         limit: 255
    t.text     "description", limit: 65535
    t.boolean  "active",                    default: true
    t.text     "tags",        limit: 65535
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "videos", ["practice_id"], name: "index_videos_on_practice_id", using: :btree
  add_index "videos", ["user_id"], name: "index_videos_on_user_id", using: :btree

end
