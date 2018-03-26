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

ActiveRecord::Schema.define(version: 20180323123022) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "advertisements", force: :cascade do |t|
    t.string "title"
    t.bigint "maker_id"
    t.integer "number_of_clicks", default: 0
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["maker_id"], name: "index_advertisements_on_maker_id"
  end

  create_table "average_caches", force: :cascade do |t|
    t.bigint "rater_id"
    t.string "rateable_type"
    t.bigint "rateable_id"
    t.float "avg", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rateable_type", "rateable_id"], name: "index_average_caches_on_rateable_type_and_rateable_id"
    t.index ["rater_id"], name: "index_average_caches_on_rater_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "colors", force: :cascade do |t|
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comment_hierarchies", force: :cascade do |t|
    t.integer "ancestor_id", null: false
    t.integer "descendant_id", null: false
    t.integer "generations", null: false
    t.index ["ancestor_id", "descendant_id", "generations"], name: "comment_anc_desc_udx", unique: true
    t.index ["descendant_id"], name: "comment_desc_idx"
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "mobile_id"
    t.index ["mobile_id"], name: "index_comments_on_mobile_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "districts", force: :cascade do |t|
    t.string "name"
    t.bigint "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_districts_on_city_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "mobile_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "mobile_id"
    t.index ["mobile_id"], name: "index_images_on_mobile_id"
  end

  create_table "makers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mobile_colors", force: :cascade do |t|
    t.bigint "mobile_id"
    t.bigint "color_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["color_id"], name: "index_mobile_colors_on_color_id"
    t.index ["mobile_id"], name: "index_mobile_colors_on_mobile_id"
  end

  create_table "mobiles", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.integer "width"
    t.integer "height"
    t.integer "front_camera"
    t.integer "behind_camera"
    t.integer "weight"
    t.integer "battery"
    t.integer "resolution_width"
    t.integer "resolution_height"
    t.string "ram"
    t.string "description"
    t.text "review"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "maker_id"
    t.string "avatar"
    t.index ["maker_id"], name: "index_mobiles_on_maker_id"
  end

  create_table "order_details", force: :cascade do |t|
    t.integer "quantity"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "order_id"
    t.bigint "mobile_id"
    t.bigint "color_id"
    t.index ["color_id"], name: "index_order_details_on_color_id"
    t.index ["mobile_id"], name: "index_order_details_on_mobile_id"
    t.index ["order_id"], name: "index_order_details_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "total_money", default: 0
    t.string "address"
    t.string "name"
    t.string "phone_number"
    t.integer "status", default: 0
    t.integer "payment_types", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "overall_averages", force: :cascade do |t|
    t.string "rateable_type"
    t.bigint "rateable_id"
    t.float "overall_avg", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rateable_type", "rateable_id"], name: "index_overall_averages_on_rateable_type_and_rateable_id"
  end

  create_table "rates", force: :cascade do |t|
    t.bigint "rater_id"
    t.string "rateable_type"
    t.bigint "rateable_id"
    t.float "stars", null: false
    t.string "dimension"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rateable_id", "rateable_type"], name: "index_rates_on_rateable_id_and_rateable_type"
    t.index ["rateable_type", "rateable_id"], name: "index_rates_on_rateable_type_and_rateable_id"
    t.index ["rater_id"], name: "index_rates_on_rater_id"
  end

  create_table "rating_caches", force: :cascade do |t|
    t.string "cacheable_type"
    t.bigint "cacheable_id"
    t.float "avg", null: false
    t.integer "qty", null: false
    t.string "dimension"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cacheable_id", "cacheable_type"], name: "index_rating_caches_on_cacheable_id_and_cacheable_type"
    t.index ["cacheable_type", "cacheable_id"], name: "index_rating_caches_on_cacheable_type_and_cacheable_id"
  end

  create_table "shop_mobiles", force: :cascade do |t|
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "shop_id"
    t.bigint "mobile_id"
    t.index ["mobile_id"], name: "index_shop_mobiles_on_mobile_id"
    t.index ["shop_id"], name: "index_shop_mobiles_on_shop_id"
  end

  create_table "shops", force: :cascade do |t|
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "city_id"
    t.bigint "district_id"
    t.index ["city_id"], name: "index_shops_on_city_id"
    t.index ["district_id"], name: "index_shops_on_district_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "address"
    t.string "phone_number"
    t.integer "role", default: 0
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "provider"
    t.string "uid"
    t.string "image"
    t.integer "failed_attempts", default: 0
    t.string "unlock_token"
    t.datetime "locked_at"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "advertisements", "makers"
  add_foreign_key "comments", "mobiles"
  add_foreign_key "comments", "users"
  add_foreign_key "districts", "cities"
  add_foreign_key "images", "mobiles"
  add_foreign_key "mobile_colors", "colors"
  add_foreign_key "mobile_colors", "mobiles"
  add_foreign_key "mobiles", "makers"
  add_foreign_key "order_details", "colors"
  add_foreign_key "order_details", "mobiles"
  add_foreign_key "order_details", "orders"
  add_foreign_key "orders", "users"
  add_foreign_key "shop_mobiles", "mobiles"
  add_foreign_key "shop_mobiles", "shops"
  add_foreign_key "shops", "cities"
  add_foreign_key "shops", "districts"
end
