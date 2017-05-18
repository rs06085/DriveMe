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

ActiveRecord::Schema.define(version: 20170518105414) do

  create_table "cars", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "car_type"
    t.integer  "year"
    t.string   "make"
    t.string   "model"
    t.string   "mileage"
    t.string   "qubic_capacity"
    t.string   "fuel_type"
    t.string   "transmission"
    t.string   "color"
    t.integer  "airbags"
    t.integer  "doors"
    t.integer  "seats"
    t.text     "description",           limit: 65535
    t.boolean  "is_all_wheel"
    t.boolean  "is_air"
    t.boolean  "is_babyseat"
    t.boolean  "is_cd_player"
    t.boolean  "is_gps"
    t.boolean  "is_pet_friendly"
    t.boolean  "is_radio"
    t.boolean  "is_camera"
    t.boolean  "is_wedding_car"
    t.integer  "daily_price"
    t.integer  "weekly_price"
    t.integer  "daily_km"
    t.integer  "weekly_km"
    t.string   "pickup_address"
    t.string   "dropoff_address"
    t.boolean  "delivery"
    t.integer  "delivery_price"
    t.date     "insurance_expiry_date"
    t.boolean  "active"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_cars_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                                default: "", null: false
    t.string   "encrypted_password",                   default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "fullname"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "image"
    t.string   "phone_number"
    t.text     "description",            limit: 65535
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "cars", "users"
end
