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

ActiveRecord::Schema.define(version: 20140819141724) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "campaign_assets", force: true do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "position",           default: 1
    t.integer  "campaign_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "campaign_assets", ["campaign_id"], name: "index_campaign_assets_on_campaign_id", using: :btree

  create_table "campaign_states", force: true do |t|
    t.string   "name",       default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "campaign_types", force: true do |t|
    t.string   "name",       default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "campaign_visits", force: true do |t|
    t.string   "referrer"
    t.string   "user_agent"
    t.string   "ip_address"
    t.integer  "campaign_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "campaign_visits", ["campaign_id"], name: "index_campaign_visits_on_campaign_id", using: :btree
  add_index "campaign_visits", ["ip_address"], name: "index_campaign_visits_on_ip_address", using: :btree

  create_table "campaigns", force: true do |t|
    t.boolean  "campaign_active",                                default: false, null: false
    t.datetime "campaign_finish_at"
    t.datetime "campaign_start_at"
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
    t.text     "description"
    t.decimal  "pledge_goal",           precision: 15, scale: 0
    t.boolean  "pledge_goal_met",                                default: false, null: false
    t.datetime "pledge_goal_met_at"
    t.integer  "pledges_count",                                  default: 0,     null: false
    t.boolean  "published",                                      default: false, null: false
    t.datetime "published_at"
    t.string   "name",                                           default: "",    null: false
    t.string   "slug",                                                           null: false
    t.text     "summary"
    t.text     "video"
    t.integer  "campaign_state_id"
    t.integer  "campaign_type_id"
    t.integer  "country_id"
    t.integer  "creator_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "genre_id"
    t.integer  "campaign_assets_count",                          default: 0
    t.string   "meta_title"
    t.string   "meta_description"
    t.integer  "campaign_visits_count",                          default: 0
  end

  add_index "campaigns", ["campaign_state_id"], name: "index_campaigns_on_campaign_state_id", using: :btree
  add_index "campaigns", ["campaign_type_id"], name: "index_campaigns_on_campaign_type_id", using: :btree
  add_index "campaigns", ["country_id"], name: "index_campaigns_on_country_id", using: :btree
  add_index "campaigns", ["creator_id"], name: "index_campaigns_on_creator_id", using: :btree
  add_index "campaigns", ["genre_id"], name: "index_campaigns_on_genre_id", using: :btree

  create_table "cities", force: true do |t|
    t.string   "name"
    t.integer  "region_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cities", ["region_id"], name: "index_cities_on_region_id", using: :btree

  create_table "communes", force: true do |t|
    t.string   "name"
    t.integer  "city_id"
    t.integer  "region_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "communes", ["city_id"], name: "index_communes_on_city_id", using: :btree
  add_index "communes", ["region_id"], name: "index_communes_on_region_id", using: :btree

  create_table "countries", force: true do |t|
    t.string   "name",       default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "genres", force: true do |t|
    t.string   "name",            default: "", null: false
    t.integer  "campaigns_count", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "genres", ["name"], name: "index_genres_on_name", using: :btree

  create_table "pledge_types", force: true do |t|
    t.string   "name",          default: "", null: false
    t.integer  "pledges_count", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pledges", force: true do |t|
    t.string   "email"
    t.decimal  "amount",         precision: 15, scale: 2, default: 0.0, null: false
    t.integer  "campaign_id"
    t.integer  "pledge_type_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pledges", ["campaign_id"], name: "index_pledges_on_campaign_id", using: :btree
  add_index "pledges", ["pledge_type_id"], name: "index_pledges_on_pledge_type_id", using: :btree
  add_index "pledges", ["user_id"], name: "index_pledges_on_user_id", using: :btree

  create_table "regions", force: true do |t|
    t.string   "name",       default: "", null: false
    t.integer  "position",   default: 0,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name",                default: "",    null: false
    t.string   "email",               default: "",    null: false
    t.boolean  "disabled",            default: false
    t.datetime "disabled_at"
    t.string   "crypted_password",                    null: false
    t.string   "password_salt",                       null: false
    t.string   "persistence_token",                   null: false
    t.string   "single_access_token"
    t.string   "perishable_token"
    t.integer  "login_count",         default: 0
    t.integer  "failed_login_count",  default: 0
    t.datetime "last_request_at"
    t.datetime "last_login_at"
    t.datetime "current_login_at"
    t.string   "last_login_ip"
    t.string   "current_login_ip"
    t.integer  "roles_mask",          default: 0
    t.string   "type"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "bio"
    t.boolean  "is_creator",          default: false
    t.string   "location"
    t.boolean  "accepts_newsletter",  default: true
    t.integer  "pledges_count",       default: 0
    t.boolean  "is_pledger",          default: false
    t.integer  "campaigns_count"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["persistence_token"], name: "users_persistence_token", using: :btree
  add_index "users", ["single_access_token"], name: "users_single_access_token", using: :btree

  create_table "website_types", force: true do |t|
    t.string   "name",           default: "", null: false
    t.integer  "websites_count", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "websites", force: true do |t|
    t.string   "name",             default: "", null: false
    t.string   "url",              default: "", null: false
    t.integer  "website_type_id"
    t.integer  "websiteable_id"
    t.string   "websiteable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "websites", ["website_type_id"], name: "index_websites_on_website_type_id", using: :btree
  add_index "websites", ["websiteable_id", "websiteable_type"], name: "index_websites_on_websiteable_id_and_websiteable_type", using: :btree

end
