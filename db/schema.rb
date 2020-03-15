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

ActiveRecord::Schema.define(version: 20190223195519) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "job_title"
    t.string "phone_number"
    t.string "avatar"
    t.boolean "seo", default: true
    t.string "authentication_token"
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "app_tokens", force: :cascade do |t|
    t.boolean "active", default: true
    t.string "token", null: false
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "platform"
    t.index ["token"], name: "index_app_tokens_on_token", unique: true
  end

  create_table "brands", force: :cascade do |t|
    t.integer "category_id"
    t.string "name"
    t.string "logo"
    t.string "banner_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "organization_id"
    t.string "p_name"
    t.boolean "following_standards", default: false
    t.string "categories", default: [], array: true
    t.string "facebook"
    t.string "twitter"
    t.string "instagram"
    t.boolean "stock_management", default: true
    t.string "description"
    t.string "pinterest"
    t.string "youtube"
    t.string "snapchat"
    t.string "google_plus"
    t.boolean "sat", default: false
    t.boolean "sun", default: false
    t.boolean "mon", default: false
    t.boolean "tue", default: false
    t.boolean "wed", default: false
    t.boolean "thu", default: false
    t.boolean "fri", default: false
    t.time "from"
    t.time "to"
    t.string "websites", default: [], array: true
    t.string "phone_numbers", default: [], array: true
    t.string "display_name"
    t.string "dark_logo"
    t.bigint "organization_manager_id"
    t.index ["organization_id"], name: "index_brands_on_organization_id"
    t.index ["organization_manager_id"], name: "index_brands_on_organization_manager_id"
  end

  create_table "buildings", force: :cascade do |t|
    t.string "name"
    t.text "address"
    t.decimal "longitude", precision: 10, scale: 6
    t.decimal "latitude", precision: 10, scale: 6
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "logo"
    t.text "description"
    t.time "open_at"
    t.time "close_at"
    t.string "banner"
    t.bigint "organization_id"
    t.string "area"
    t.string "p_name"
    t.integer "floors_count", default: 0
    t.string "building_type"
    t.index ["organization_id"], name: "index_buildings_on_organization_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "parent_id"
    t.string "logo"
    t.string "p_name"
  end

  create_table "cities", force: :cascade do |t|
    t.bigint "country_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_cities_on_country_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "developers", force: :cascade do |t|
    t.string "name"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employee_users", force: :cascade do |t|
    t.string "name"
    t.string "job_title"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "type"
    t.string "avatar"
    t.bigint "organization_id"
    t.string "authentication_token"
    t.integer "created_by"
    t.boolean "seo", default: false
    t.boolean "following_standards", default: false
    t.integer "service_type", default: 0
    t.boolean "tutorial", default: true
    t.bigint "shop_id"
    t.bigint "organization_manager_id"
    t.index ["email"], name: "index_employee_users_on_email", unique: true
    t.index ["organization_id"], name: "index_employee_users_on_organization_id"
    t.index ["organization_manager_id"], name: "index_employee_users_on_organization_manager_id"
    t.index ["reset_password_token"], name: "index_employee_users_on_reset_password_token", unique: true
    t.index ["shop_id"], name: "index_employee_users_on_shop_id"
  end

  create_table "entries", force: :cascade do |t|
    t.decimal "price", precision: 10, scale: 2
    t.bigint "pocket_id"
    t.bigint "order_id"
    t.bigint "shop_id"
    t.bigint "sub_product_id"
    t.integer "quantity", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_entries_on_order_id"
    t.index ["pocket_id"], name: "index_entries_on_pocket_id"
    t.index ["shop_id"], name: "index_entries_on_shop_id"
    t.index ["sub_product_id"], name: "index_entries_on_sub_product_id"
  end

  create_table "facebook_pixels", force: :cascade do |t|
    t.bigint "shop_id"
    t.string "pixel_id"
    t.boolean "general", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "organization_id"
    t.bigint "organization_manager_id"
    t.index ["organization_id"], name: "index_facebook_pixels_on_organization_id"
    t.index ["organization_manager_id"], name: "index_facebook_pixels_on_organization_manager_id"
    t.index ["shop_id"], name: "index_facebook_pixels_on_shop_id"
  end

  create_table "features", force: :cascade do |t|
    t.boolean "cart"
    t.boolean "campaign"
    t.boolean "beacon"
    t.boolean "panorama360"
    t.bigint "organization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_features_on_organization_id"
  end

  create_table "google_analytics", force: :cascade do |t|
    t.bigint "organization_id"
    t.bigint "employee_user_id"
    t.bigint "shop_id"
    t.string "tracking_id"
    t.boolean "general"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_user_id"], name: "index_google_analytics_on_employee_user_id"
    t.index ["organization_id"], name: "index_google_analytics_on_organization_id"
    t.index ["shop_id"], name: "index_google_analytics_on_shop_id"
  end

  create_table "malls", force: :cascade do |t|
    t.bigint "city_id"
    t.string "name"
    t.string "area"
    t.string "p_area"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_malls_on_city_id"
  end

  create_table "meta_tags", force: :cascade do |t|
    t.bigint "shop_id"
    t.string "name"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "organization_id"
    t.bigint "product_id"
    t.index ["organization_id"], name: "index_meta_tags_on_organization_id"
    t.index ["product_id"], name: "index_meta_tags_on_product_id"
    t.index ["shop_id"], name: "index_meta_tags_on_shop_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "address", limit: 150
    t.string "email", limit: 40
    t.string "name", limit: 40
    t.integer "payment_type", default: 0
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "date_delivery"
    t.bigint "organization_id"
    t.integer "status", default: 1
    t.string "cancelation_reasons", default: [], array: true
    t.bigint "shop_id"
    t.string "driver_name"
    t.boolean "equipped", default: false
    t.index ["organization_id"], name: "index_orders_on_organization_id"
    t.index ["shop_id"], name: "index_orders_on_shop_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "organization_managers", force: :cascade do |t|
    t.string "email"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "name"
    t.string "avatar"
    t.string "job_title"
    t.string "authentication_token"
    t.boolean "seo", default: false
    t.boolean "following_standards", default: false
    t.boolean "tutorial", default: false
    t.integer "service_type", default: 0
    t.bigint "organization_id"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_organization_managers_on_email", unique: true
    t.index ["organization_id"], name: "index_organization_managers_on_organization_id"
    t.index ["reset_password_token"], name: "index_organization_managers_on_reset_password_token", unique: true
  end

  create_table "organization_plans", force: :cascade do |t|
    t.string "country"
    t.integer "stores_count"
    t.decimal "price"
    t.bigint "organization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_organization_plans_on_organization_id"
  end

  create_table "organization_themes", force: :cascade do |t|
    t.string "first_color", default: "#cb0226"
    t.string "second_color", default: "#231f1f"
    t.boolean "first_section", default: false
    t.integer "first_section_product"
    t.string "first_section_image"
    t.string "logo"
    t.boolean "second_section", default: false
    t.integer "second_section_product"
    t.string "second_section_image"
    t.boolean "slider_body", default: false
    t.string "slider_header"
    t.string "slider_images", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "organization_id"
    t.index ["organization_id"], name: "index_organization_themes_on_organization_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "p_name"
  end

  create_table "permission_roles", force: :cascade do |t|
    t.integer "permission_id"
    t.integer "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "permissions", force: :cascade do |t|
    t.string "target_model_name"
    t.string "action"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text "content"
    t.string "searchable_type"
    t.bigint "searchable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id"
  end

  create_table "pockets", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_pockets_on_user_id"
  end

  create_table "powers", force: :cascade do |t|
    t.boolean "money_redeem", default: false
    t.boolean "product_redeem", default: false
    t.boolean "navbox_scan", default: false
    t.boolean "clients_profile", default: false
    t.boolean "branch_analytics", default: false
    t.boolean "create_campaign", default: false
    t.boolean "branch_storage", default: false
    t.boolean "home_delivery", default: false
    t.bigint "organization_id"
    t.bigint "employee_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_user_id"], name: "index_powers_on_employee_user_id"
    t.index ["organization_id"], name: "index_powers_on_organization_id"
  end

  create_table "product_positions", force: :cascade do |t|
    t.bigint "shop360_id"
    t.bigint "organization_id"
    t.text "positions_json_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "preview_json_data"
    t.index ["organization_id"], name: "index_product_positions_on_organization_id"
    t.index ["shop360_id"], name: "index_product_positions_on_shop360_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "p_name"
    t.string "description"
    t.string "cover_image"
    t.boolean "info_updated", default: false
    t.bigint "brand_id"
    t.bigint "category_id"
    t.bigint "organization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "item_id"
    t.index ["brand_id"], name: "index_products_on_brand_id"
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["organization_id"], name: "index_products_on_organization_id"
  end

  create_table "products_olds", force: :cascade do |t|
    t.integer "category_id"
    t.bigint "brand_id"
    t.float "price"
    t.float "discount"
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "cover_image"
    t.string "vr_slider", default: [], array: true
    t.integer "number"
    t.string "fitting_room"
    t.bigint "organization_id"
    t.string "barcode"
    t.text "temp_image"
    t.string "ean"
    t.string "view_image"
    t.bigint "shop_id"
    t.string "p_name"
    t.boolean "updated_online", default: false
    t.text "temp_colors", default: [], array: true
    t.text "temp_sizes", default: [], array: true
    t.index ["brand_id"], name: "index_products_olds_on_brand_id"
    t.index ["category_id"], name: "index_products_olds_on_category_id"
    t.index ["organization_id"], name: "index_products_olds_on_organization_id"
    t.index ["shop_id"], name: "index_products_olds_on_shop_id"
  end

  create_table "role_employee_users", force: :cascade do |t|
    t.integer "employee_user_id"
    t.integer "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "organization_id"
    t.index ["organization_id"], name: "index_roles_on_organization_id"
  end

  create_table "scenes", force: :cascade do |t|
    t.bigint "shop_section_id"
    t.bigint "organization_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.index ["organization_id"], name: "index_scenes_on_organization_id"
    t.index ["shop_section_id"], name: "index_scenes_on_shop_section_id"
  end

  create_table "sections", force: :cascade do |t|
    t.bigint "shop360_id"
    t.text "web_json_data"
    t.text "mobile_json_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.string "title"
    t.bigint "organization_id"
    t.index ["organization_id"], name: "index_sections_on_organization_id"
    t.index ["shop360_id"], name: "index_sections_on_shop360_id"
  end

  create_table "seo_page_titles", force: :cascade do |t|
    t.bigint "organization_id"
    t.bigint "shop_id"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_seo_page_titles_on_organization_id"
    t.index ["shop_id"], name: "index_seo_page_titles_on_shop_id"
  end

  create_table "shop360s", force: :cascade do |t|
    t.bigint "shop_id"
    t.text "web_json_data"
    t.string "url"
    t.string "scene_asset_bundle"
    t.string "scene_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "mobile_json_data"
    t.boolean "published", default: false
    t.text "preview_json_data"
    t.index ["shop_id"], name: "index_shop360s_on_shop_id"
  end

  create_table "shop_floors", force: :cascade do |t|
    t.integer "number"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "shop360_id"
    t.bigint "organization_id"
    t.index ["organization_id"], name: "index_shop_floors_on_organization_id"
    t.index ["shop360_id"], name: "index_shop_floors_on_shop360_id"
  end

  create_table "shop_sections", force: :cascade do |t|
    t.bigint "shop_floor_id"
    t.bigint "organization_id"
    t.string "name"
    t.text "web_json_data"
    t.text "mobile_json_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.index ["organization_id"], name: "index_shop_sections_on_organization_id"
    t.index ["shop_floor_id"], name: "index_shop_sections_on_shop_floor_id"
  end

  create_table "shops", force: :cascade do |t|
    t.string "name"
    t.string "country"
    t.string "city"
    t.string "zip"
    t.string "street"
    t.string "street_number"
    t.string "floor"
    t.string "phone_number"
    t.integer "brand_id"
    t.decimal "lat", precision: 10, scale: 6
    t.decimal "lng", precision: 10, scale: 6
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "remote_id"
    t.integer "building_id"
    t.bigint "organization_id"
    t.text "work_times"
    t.string "view_image"
    t.string "p_street"
    t.datetime "time_from"
    t.datetime "time_to"
    t.string "work_days", default: [], array: true
    t.string "logo"
    t.boolean "enable_logo", default: true
    t.string "address"
    t.string "banner"
    t.string "p_name"
    t.string "area"
    t.string "p_area"
    t.bigint "mall_id"
    t.index ["mall_id"], name: "index_shops_on_mall_id"
    t.index ["organization_id"], name: "index_shops_on_organization_id"
  end

  create_table "social_links", force: :cascade do |t|
    t.string "facebook"
    t.string "twitter"
    t.string "instagram"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "organization_id"
    t.index ["organization_id"], name: "index_social_links_on_organization_id"
  end

  create_table "stocks", force: :cascade do |t|
    t.bigint "shop_id"
    t.integer "quantity"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "organization_id"
    t.decimal "price", precision: 10, scale: 2, default: "0.0"
    t.decimal "discount", precision: 10, scale: 2, default: "0.0"
    t.bigint "sub_product_id"
    t.bigint "product_id"
    t.index ["organization_id"], name: "index_stocks_on_organization_id"
    t.index ["product_id"], name: "index_stocks_on_product_id"
    t.index ["shop_id"], name: "index_stocks_on_shop_id"
    t.index ["sub_product_id"], name: "index_stocks_on_sub_product_id"
  end

  create_table "storages_olds", force: :cascade do |t|
    t.bigint "brand_id"
    t.bigint "category_id"
    t.string "name"
    t.text "description"
    t.float "price"
    t.string "barcode"
    t.string "ean"
    t.string "cover_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "organization_id"
    t.text "temp_image"
    t.boolean "info_updated", default: false
    t.text "temp_colors", default: [], array: true
    t.text "temp_sizes", default: [], array: true
    t.string "vr_slider", default: [], array: true
    t.index ["brand_id"], name: "index_storages_olds_on_brand_id"
    t.index ["category_id"], name: "index_storages_olds_on_category_id"
    t.index ["organization_id"], name: "index_storages_olds_on_organization_id"
  end

  create_table "sub_products", force: :cascade do |t|
    t.bigint "product_id"
    t.string "barcode"
    t.float "price", default: 0.0
    t.float "discount", default: 0.0
    t.string "color"
    t.string "size"
    t.integer "quantity", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "brand_id"
    t.bigint "organization_id"
    t.string "gallery", default: [], array: true
    t.integer "gallery_index", default: 0
    t.boolean "popup", default: false
    t.string "item_id"
    t.string "cover_image"
    t.index ["brand_id"], name: "index_sub_products_on_brand_id"
    t.index ["organization_id"], name: "index_sub_products_on_organization_id"
    t.index ["product_id"], name: "index_sub_products_on_product_id"
  end

  create_table "subscribed_users", force: :cascade do |t|
    t.string "email"
    t.bigint "shop_id"
    t.bigint "organization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_subscribed_users_on_organization_id"
    t.index ["shop_id"], name: "index_subscribed_users_on_shop_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_name"
    t.string "avatar"
    t.string "gender"
    t.string "birth_date"
    t.string "authentication_token", default: ""
    t.string "provider"
    t.string "uid"
    t.string "firebase_token"
    t.string "address"
    t.string "country"
    t.string "city"
    t.string "phone_number"
    t.string "post_code"
    t.integer "flat_number", default: 0
    t.text "image"
    t.string "oauth_token"
    t.datetime "oauth_expires_at"
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "work_times", force: :cascade do |t|
    t.boolean "sat"
    t.boolean "sun"
    t.boolean "mon"
    t.boolean "tue"
    t.boolean "wed"
    t.boolean "thu"
    t.boolean "fri"
    t.datetime "opening_at"
    t.datetime "closing_at"
    t.bigint "shop_id"
    t.bigint "organization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_work_times_on_organization_id"
    t.index ["shop_id"], name: "index_work_times_on_shop_id"
  end

  add_foreign_key "brands", "organization_managers"
  add_foreign_key "categories", "categories", column: "parent_id", on_delete: :cascade
  add_foreign_key "cities", "countries"
  add_foreign_key "facebook_pixels", "organization_managers"
  add_foreign_key "features", "organizations"
  add_foreign_key "malls", "cities"
  add_foreign_key "orders", "users"
  add_foreign_key "organization_managers", "organizations"
  add_foreign_key "organization_themes", "organizations"
  add_foreign_key "pockets", "users"
  add_foreign_key "product_positions", "organizations"
  add_foreign_key "product_positions", "shop360s"
  add_foreign_key "products_olds", "brands"
  add_foreign_key "products_olds", "categories"
  add_foreign_key "scenes", "organizations"
  add_foreign_key "scenes", "shop_sections"
  add_foreign_key "shop360s", "shops"
  add_foreign_key "shop_floors", "organizations"
  add_foreign_key "shop_floors", "shop360s"
  add_foreign_key "shop_sections", "organizations"
  add_foreign_key "shop_sections", "shop_floors"
  add_foreign_key "shops", "malls"
  add_foreign_key "social_links", "organizations"
  add_foreign_key "stocks", "products"
  add_foreign_key "stocks", "shops"
  add_foreign_key "stocks", "sub_products"
  add_foreign_key "subscribed_users", "organizations"
  add_foreign_key "subscribed_users", "shops"
  add_foreign_key "work_times", "organizations"
  add_foreign_key "work_times", "shops"
end
