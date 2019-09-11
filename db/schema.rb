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

ActiveRecord::Schema.define(version: 2019_09_11_194136) do

  create_table "attacks", force: :cascade do |t|
    t.string "name"
    t.integer "damage"
  end

  create_table "poke_attacks", force: :cascade do |t|
    t.integer "pokemon_id"
    t.integer "attack_id"
    t.index ["attack_id"], name: "index_poke_attacks_on_attack_id"
    t.index ["pokemon_id"], name: "index_poke_attacks_on_pokemon_id"
  end

  create_table "pokemons", force: :cascade do |t|
    t.string "name"
    t.integer "health"
  end

end
