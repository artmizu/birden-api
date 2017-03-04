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

ActiveRecord::Schema.define(version: 20170226215739) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "anime_scores", force: :cascade do |t|
    t.integer  "value"
    t.integer  "anime_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["anime_id"], name: "index_anime_scores_on_anime_id", using: :btree
    t.index ["user_id"], name: "index_anime_scores_on_user_id", using: :btree
  end

  create_table "animes", id: :bigint, default: -> { "nextval('id_seq'::regclass)" }, force: :cascade do |t|
    t.text     "cover"
    t.text     "title"
    t.text     "manufacturer"
    t.text     "anime_type"
    t.text     "date"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "video_preview"
  end

  create_table "genres", id: :bigint, default: -> { "nextval('ids'::regclass)" }, force: :cascade do |t|
    t.text     "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "item_lists", id: :bigint, default: -> { "nextval('ids_list'::regclass)" }, force: :cascade do |t|
    t.bigint   "anime_id"
    t.bigint   "genre_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["anime_id"], name: "idx_24615_index_item_lists_on_anime_id", using: :btree
    t.index ["genre_id"], name: "idx_24615_index_item_lists_on_genre_id", using: :btree
  end

  create_table "series", id: :bigint, default: -> { "nextval('id_series'::regclass)" }, force: :cascade do |t|
    t.bigint   "anime_id"
    t.text     "video"
    t.text     "number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "duration"
    t.text     "thumb"
    t.text     "cover"
    t.boolean  "is_video_preview", default: false
    t.index ["anime_id"], name: "idx_24618_index_series_on_anime_id", using: :btree
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "anime_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["anime_id"], name: "index_subscriptions_on_anime_id", using: :btree
    t.index ["user_id"], name: "index_subscriptions_on_user_id", using: :btree
  end

  create_table "user_notifications", force: :cascade do |t|
    t.integer "user_id"
    t.boolean "is_watch",  default: false
    t.integer "series_id"
    t.index ["series_id"], name: "index_user_notifications_on_series_id", using: :btree
    t.index ["user_id"], name: "index_user_notifications_on_user_id", using: :btree
  end

  create_table "users", id: :bigint, default: -> { "nextval('ids_user'::regclass)" }, force: :cascade do |t|
    t.text     "email"
    t.text     "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_admin",        default: false
  end

end
