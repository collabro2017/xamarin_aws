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

ActiveRecord::Schema.define(version: 20180403160728) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "provider",               default: "email", null: false
    t.string   "uid",                    default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "name"
    t.string   "nickname"
    t.string   "image"
    t.string   "email"
    t.json     "tokens"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.index ["confirmation_token"], name: "index_admins_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_admins_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree
    t.index ["uid", "provider"], name: "index_admins_on_uid_and_provider", unique: true, using: :btree
  end

  create_table "rating_categories", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.integer  "rating_category_id"
    t.string   "image",                          null: false
    t.string   "name",                           null: false
    t.integer  "order",              default: 0
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "position",           default: 0
    t.index ["rating_category_id"], name: "index_ratings_on_rating_category_id", using: :btree
  end

  create_table "restaurants", force: :cascade do |t|
    t.string   "name",                    null: false
    t.string   "place_id",                null: false
    t.string   "address",                 null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.float    "lat"
    t.float    "lng"
    t.integer  "rating",     default: -1
    t.string   "photo"
    t.index ["place_id"], name: "index_restaurants_on_place_id", using: :btree
  end

  create_table "user_devices", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "device_token",                 null: false
    t.string   "platform",     default: "ios", null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["user_id"], name: "index_user_devices_on_user_id", using: :btree
  end

  create_table "user_points", force: :cascade do |t|
    t.integer  "user_id",                        null: false
    t.integer  "rating_category_id"
    t.integer  "value",              default: 0
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["rating_category_id"], name: "index_user_points_on_rating_category_id", using: :btree
    t.index ["user_id"], name: "index_user_points_on_user_id", using: :btree
  end

  create_table "user_ratings", force: :cascade do |t|
    t.integer  "user_id",       null: false
    t.integer  "restaurant_id", null: false
    t.integer  "rating_id",     null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["rating_id"], name: "index_user_ratings_on_rating_id", using: :btree
    t.index ["restaurant_id"], name: "index_user_ratings_on_restaurant_id", using: :btree
    t.index ["user_id"], name: "index_user_ratings_on_user_id", using: :btree
  end

  create_table "user_settings", force: :cascade do |t|
    t.integer  "user_id"
    t.boolean  "location_notification", default: true
    t.boolean  "trend_notification",    default: false
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.text     "ratings_order",         default: ["1", "2", "3", "4"],              array: true
    t.index ["user_id"], name: "index_user_settings_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider",               default: "email", null: false
    t.string   "uid",                    default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.json     "tokens"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "photo",                  default: ""
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree
  end

  add_foreign_key "ratings", "rating_categories"
  add_foreign_key "user_devices", "users"
  add_foreign_key "user_points", "rating_categories"
  add_foreign_key "user_points", "users"
  add_foreign_key "user_ratings", "ratings"
  add_foreign_key "user_ratings", "restaurants"
  add_foreign_key "user_ratings", "users"
  add_foreign_key "user_settings", "users"
end
