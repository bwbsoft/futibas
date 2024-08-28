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

ActiveRecord::Schema[7.1].define(version: 2024_08_28_191433) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  # Custom types defined in this database.
  # Note that some types may not work with other database engines. Be careful if changing database.
  create_enum "game_teams", ["a", "b", "no_team"]

  create_table "games", force: :cascade do |t|
    t.uuid "group_id", null: false
    t.bigint "place_id", null: false
    t.uuid "user_id", null: false
    t.integer "status", default: 0
    t.string "title", null: false
    t.datetime "date", precision: nil
    t.string "notes"
    t.enum "winner_team", default: "no_team", null: false, enum_type: "game_teams"
    t.integer "team_a_score", default: 0
    t.integer "team_b_score", default: 0
    t.bigint "mvp_id"
    t.bigint "greatest_impact_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["greatest_impact_id"], name: "index_games_on_greatest_impact_id"
    t.index ["group_id"], name: "index_games_on_group_id"
    t.index ["mvp_id"], name: "index_games_on_mvp_id"
    t.index ["place_id"], name: "index_games_on_place_id"
    t.index ["title"], name: "index_games_on_title"
    t.index ["user_id"], name: "index_games_on_user_id"
  end

  create_table "games_players", force: :cascade do |t|
    t.bigint "game_id", null: false
    t.bigint "player_id", null: false
    t.enum "team", default: "no_team", null: false, enum_type: "game_teams"
    t.integer "goals", default: 0
    t.integer "assists", default: 0
    t.integer "saves", default: 0
    t.integer "yellow_cards", default: 0
    t.integer "red_cards", default: 0
    t.boolean "absent", default: false
    t.boolean "mvp", default: false
    t.decimal "impact", precision: 3, scale: 2
    t.string "notes"
    t.integer "points", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_games_players_on_game_id"
    t.index ["player_id"], name: "index_games_players_on_player_id"
  end

  create_table "groups", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "notes"
    t.string "picture"
    t.string "discord_webhook_url"
    t.uuid "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_groups_on_user_id"
  end

  create_table "places", force: :cascade do |t|
    t.string "name"
    t.string "uf"
    t.string "city"
    t.string "district"
    t.string "address"
    t.string "phone"
    t.string "website"
    t.string "instagram"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address"], name: "index_places_on_address"
    t.index ["city"], name: "index_places_on_city"
    t.index ["district"], name: "index_places_on_district"
    t.index ["instagram"], name: "index_places_on_instagram"
    t.index ["name", "city"], name: "index_places_on_name_and_city", unique: true
    t.index ["name"], name: "index_places_on_name"
    t.index ["phone"], name: "index_places_on_phone"
    t.index ["uf"], name: "index_places_on_uf"
    t.index ["website"], name: "index_places_on_website"
  end

  create_table "players", force: :cascade do |t|
    t.uuid "group_id", null: false
    t.uuid "user_id"
    t.string "name", null: false
    t.string "nickname"
    t.string "picture"
    t.string "notes"
    t.string "cpf"
    t.string "phone"
    t.string "email"
    t.string "instagram"
    t.integer "points", default: 0
    t.integer "consecutive_victories", default: 0
    t.integer "mvp_times", default: 0
    t.integer "biggest_impact_times", default: 0
    t.integer "goals", default: 0
    t.integer "assists", default: 0
    t.integer "saves", default: 0
    t.integer "yellow_cards", default: 0
    t.integer "red_cards", default: 0
    t.integer "matches_won", default: 0
    t.integer "matches_lost", default: 0
    t.integer "matches_drawn", default: 0
    t.integer "matches_played", default: 0
    t.integer "absences", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cpf"], name: "index_players_on_cpf"
    t.index ["email"], name: "index_players_on_email"
    t.index ["group_id", "cpf"], name: "index_players_on_group_id_and_cpf", unique: true, where: "(cpf IS NOT NULL)"
    t.index ["group_id"], name: "index_players_on_group_id"
    t.index ["instagram"], name: "index_players_on_instagram"
    t.index ["name"], name: "index_players_on_name"
    t.index ["phone"], name: "index_players_on_phone"
    t.index ["user_id"], name: "index_players_on_user_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "role", default: 0
    t.string "name", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "phone"
    t.string "instagram"
    t.string "picture"
    t.string "cpf"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cpf"], name: "index_users_on_cpf", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["instagram"], name: "index_users_on_instagram"
    t.index ["phone"], name: "index_users_on_phone"
  end

  add_foreign_key "games", "groups"
  add_foreign_key "games", "places"
  add_foreign_key "games", "players", column: "greatest_impact_id"
  add_foreign_key "games", "players", column: "mvp_id"
  add_foreign_key "games", "users"
  add_foreign_key "games_players", "games"
  add_foreign_key "games_players", "players"
  add_foreign_key "groups", "users"
  add_foreign_key "players", "groups"
  add_foreign_key "players", "users"
end
