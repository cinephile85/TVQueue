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

ActiveRecord::Schema.define(version: 20180516002722) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "episodes", force: :cascade do |t|
    t.bigint "tv_show_id"
    t.integer "season"
    t.integer "episode_number"
    t.date "airdate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.string "still_path"
    t.index ["tv_show_id"], name: "index_episodes_on_tv_show_id"
  end

  create_table "networks", force: :cascade do |t|
    t.integer "tmdb_id"
    t.string "name"
    t.string "logo_path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "queued_episodes", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "episode_id"
    t.boolean "viewed", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["episode_id"], name: "index_queued_episodes_on_episode_id"
    t.index ["user_id", "episode_id"], name: "index_queued_episodes_on_user_id_and_episode_id", unique: true
    t.index ["user_id"], name: "index_queued_episodes_on_user_id"
  end

  create_table "tv_shows", force: :cascade do |t|
    t.integer "tmdb_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.integer "number_of_seasons"
    t.string "poster_path"
    t.bigint "network_id"
    t.index ["network_id"], name: "index_tv_shows_on_network_id"
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "episodes", "tv_shows"
  add_foreign_key "queued_episodes", "episodes"
  add_foreign_key "queued_episodes", "users"
  add_foreign_key "tv_shows", "networks"
end
