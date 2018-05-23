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

ActiveRecord::Schema.define(version: 20180523143443) do

  create_table "amenities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.boolean  "essentials"
    t.boolean  "wifi"
    t.boolean  "shampoo"
    t.boolean  "closet"
    t.boolean  "tv"
    t.boolean  "heat"
    t.boolean  "air_condditioner"
    t.boolean  "breakfast"
    t.boolean  "workspace"
    t.boolean  "fireplace"
    t.boolean  "iron"
    t.boolean  "hair_dryer"
    t.boolean  "animals"
    t.boolean  "private_entrance"
    t.boolean  "smoke_detector"
    t.boolean  "carbon_monoxide_detector"
    t.boolean  "first_aid_kit"
    t.boolean  "safety_card"
    t.boolean  "fire_extinguisher"
    t.boolean  "bedroom_lock"
    t.boolean  "private_livingroom"
    t.boolean  "pool"
    t.boolean  "kitchen"
    t.boolean  "laundry_washer"
    t.boolean  "laundry_dryer"
    t.boolean  "parking"
    t.boolean  "elevator"
    t.boolean  "hot_tub"
    t.boolean  "gym"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "room_id_id"
    t.integer  "room_id"
    t.index ["room_id"], name: "index_amenities_on_room_id", using: :btree
    t.index ["room_id_id"], name: "index_amenities_on_room_id_id", using: :btree
  end

  create_table "room_images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "content",    null: false
    t.integer  "status",     null: false
    t.integer  "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_room_images_on_room_id", using: :btree
  end

  create_table "rooms", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "category",                           null: false
    t.integer  "property_type",                      null: false
    t.integer  "room_type",                          null: false
    t.boolean  "occupied",                           null: false
    t.integer  "capacity",                           null: false
    t.integer  "bedrooms",                           null: false
    t.integer  "beds",                               null: false
    t.integer  "bathrooms",                          null: false
    t.boolean  "bathroom_private",                   null: false
    t.string   "location",                           null: false
    t.text     "summary",              limit: 65535, null: false
    t.boolean  "family"
    t.boolean  "group"
    t.boolean  "pets"
    t.text     "other",                limit: 65535
    t.integer  "reservation_deadline"
    t.integer  "check_in_from"
    t.integer  "check_in_to"
    t.integer  "min_stay"
    t.integer  "max_stay"
    t.integer  "base_price"
    t.integer  "user_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.index ["user_id"], name: "index_rooms_on_user_id", using: :btree
  end

  create_table "user_images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "content",    null: false
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_images_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "firstname",                                         null: false
    t.string   "lastname",                                          null: false
    t.integer  "gender",                                            null: false
    t.date     "birthday",                                          null: false
    t.string   "email",                                default: "", null: false
    t.string   "encrypted_password",                   default: "", null: false
    t.integer  "phone"
    t.integer  "language"
    t.integer  "currency"
    t.string   "address"
    t.text     "introduction",           limit: 65535
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
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "amenities", "rooms"
  add_foreign_key "room_images", "rooms"
  add_foreign_key "rooms", "users"
  add_foreign_key "user_images", "users"
end
