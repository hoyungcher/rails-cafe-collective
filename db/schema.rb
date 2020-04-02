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

ActiveRecord::Schema.define(version: 2020_04_01_023029) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "booked_hours", force: :cascade do |t|
    t.bigint "booking_id"
    t.bigint "hourly_slot_id"
    t.boolean "paid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_booked_hours_on_booking_id"
    t.index ["hourly_slot_id"], name: "index_booked_hours_on_hourly_slot_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.bigint "user_id"
    t.date "date"
    t.integer "start_time"
    t.integer "duration"
    t.string "special_requests"
    t.integer "total_credits"
    t.integer "remaining_credits"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active", default: false
    t.string "state"
    t.integer "total_credits_cents", default: 0, null: false
    t.string "checkout_session_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "bookmarks", force: :cascade do |t|
    t.bigint "cafe_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cafe_id"], name: "index_bookmarks_on_cafe_id"
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "cafe_tags", force: :cascade do |t|
    t.bigint "cafe_id"
    t.bigint "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cafe_id"], name: "index_cafe_tags_on_cafe_id"
    t.index ["tag_id"], name: "index_cafe_tags_on_tag_id"
  end

  create_table "cafes", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "neighbourhood"
    t.string "address"
    t.string "city"
    t.string "category"
    t.string "contact"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.index ["user_id"], name: "index_cafes_on_user_id"
  end

  create_table "hourly_slots", force: :cascade do |t|
    t.bigint "cafe_id"
    t.integer "start_time"
    t.integer "total_seats"
    t.integer "price_per_hour"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cafe_id"], name: "index_hourly_slots_on_cafe_id"
  end

  create_table "menu_items", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "category"
    t.integer "price"
    t.bigint "cafe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cafe_id"], name: "index_menu_items_on_cafe_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "menu_item_id"
    t.bigint "booking_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "delivered", default: false
    t.index ["booking_id"], name: "index_orders_on_booking_id"
    t.index ["menu_item_id"], name: "index_orders_on_menu_item_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "cafe_id"
    t.string "content"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cafe_id"], name: "index_reviews_on_cafe_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.string "tag_category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.boolean "owner"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "booked_hours", "bookings"
  add_foreign_key "booked_hours", "hourly_slots"
  add_foreign_key "bookings", "users"
  add_foreign_key "bookmarks", "cafes"
  add_foreign_key "bookmarks", "users"
  add_foreign_key "cafe_tags", "cafes"
  add_foreign_key "cafe_tags", "tags"
  add_foreign_key "cafes", "users"
  add_foreign_key "hourly_slots", "cafes"
  add_foreign_key "menu_items", "cafes"
  add_foreign_key "orders", "bookings"
  add_foreign_key "orders", "menu_items"
  add_foreign_key "reviews", "cafes"
  add_foreign_key "reviews", "users"
end
