# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_03_21_055031) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "groups", force: :cascade do |t|
    t.string "name", null: false
    t.string "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matches", force: :cascade do |t|
    t.bigint "place_id", null: false
    t.bigint "group_id", null: false
    t.datetime "date", precision: nil
    t.string "notes"
    t.integer "winner"
    t.integer "team1_score"
    t.integer "team2_score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_matches_on_group_id"
    t.index ["place_id"], name: "index_matches_on_place_id"
  end

  create_table "places", force: :cascade do |t|
    t.string "name"
    t.string "uf"
    t.string "city"
    t.string "district"
    t.string "address"
    t.string "phone"
    t.string "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address"], name: "index_places_on_address"
    t.index ["city"], name: "index_places_on_city"
    t.index ["district"], name: "index_places_on_district"
    t.index ["name", "city"], name: "index_places_on_name_and_city", unique: true
    t.index ["name"], name: "index_places_on_name"
    t.index ["phone"], name: "index_places_on_phone"
    t.index ["uf"], name: "index_places_on_uf"
    t.index ["website"], name: "index_places_on_website"
  end

  create_table "players", force: :cascade do |t|
    t.bigint "group_id", null: false
    t.string "name", null: false
    t.string "notes"
    t.string "phone"
    t.integer "level", limit: 2, default: 5
    t.jsonb "skills", default: []
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_players_on_group_id"
    t.index ["name"], name: "index_players_on_name"
    t.index ["phone"], name: "index_players_on_phone"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "password", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "matches", "groups"
  add_foreign_key "matches", "places"
  add_foreign_key "players", "groups"
end
