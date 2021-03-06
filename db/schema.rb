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

ActiveRecord::Schema.define(version: 20160809162147) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "follows", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "site_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["site_id"], name: "index_follows_on_site_id", using: :btree
    t.index ["user_id"], name: "index_follows_on_user_id", using: :btree
  end

  create_table "hives", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "site_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["site_id"], name: "index_hives_on_site_id", using: :btree
  end

  create_table "logs", force: :cascade do |t|
    t.text     "notes"
    t.integer  "hive_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "log_img_file_name"
    t.string   "log_img_content_type"
    t.integer  "log_img_file_size"
    t.datetime "log_img_updated_at"
    t.index ["hive_id"], name: "index_logs_on_hive_id", using: :btree
  end

  create_table "sites", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "longitude"
    t.string   "latitude"
    t.integer  "user_id"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "status",                default: "healthy"
    t.string   "site_img_file_name"
    t.string   "site_img_content_type"
    t.integer  "site_img_file_size"
    t.datetime "site_img_updated_at"
    t.index ["user_id"], name: "index_sites_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "uid"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "token"
    t.string   "expires_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "api_key"
  end

  add_foreign_key "follows", "sites"
  add_foreign_key "follows", "users"
  add_foreign_key "hives", "sites"
  add_foreign_key "logs", "hives"
  add_foreign_key "sites", "users"
end
