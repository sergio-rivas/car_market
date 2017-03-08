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

ActiveRecord::Schema.define(version: 20170308101908) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.date     "appointment_date"
    t.datetime "appointment_time"
    t.integer  "user_id"
    t.integer  "car_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["car_id"], name: "index_appointments_on_car_id", using: :btree
    t.index ["user_id"], name: "index_appointments_on_user_id", using: :btree
  end

  create_table "attachinary_files", force: :cascade do |t|
    t.string   "attachinariable_type"
    t.integer  "attachinariable_id"
    t.string   "scope"
    t.string   "public_id"
    t.string   "version"
    t.integer  "width"
    t.integer  "height"
    t.string   "format"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["attachinariable_type", "attachinariable_id", "scope"], name: "by_scoped_parent", using: :btree
  end

  create_table "brands", force: :cascade do |t|
    t.string   "car_query_id"
    t.string   "brand_name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "cars", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "model_id"
    t.integer  "price"
    t.string   "odometer"
    t.string   "year"
    t.string   "transmission"
    t.text     "description"
    t.string   "fuel_type"
    t.string   "engine_power_cc"
    t.string   "engine_power_hp"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "mpg_city"
    t.string   "mpg_highway"
    t.string   "vin"
    t.string   "size"
    t.string   "style"
    t.string   "price_suggested"
    t.string   "color_ext"
    t.string   "color_int"
    t.string   "doors"
    t.string   "drive"
    t.index ["model_id"], name: "index_cars_on_model_id", using: :btree
    t.index ["user_id"], name: "index_cars_on_user_id", using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.string   "content"
    t.integer  "car_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["car_id"], name: "index_messages_on_car_id", using: :btree
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
  end

  create_table "models", force: :cascade do |t|
    t.string   "name"
    t.integer  "brand_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_models_on_brand_id", using: :btree
  end

  create_table "search_data", force: :cascade do |t|
    t.jsonb    "metadata"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "facebook_picture_url"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "token"
    t.datetime "token_expiry"
    t.string   "phone_number"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "appointments", "cars"
  add_foreign_key "appointments", "users"
  add_foreign_key "messages", "cars"
  add_foreign_key "messages", "users"
end
