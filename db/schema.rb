# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_12_04_222911) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "decision_material_states", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "decision_id", null: false
    t.uuid "material_state_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["decision_id"], name: "index_decision_material_states_on_decision_id"
    t.index ["material_state_id"], name: "index_decision_material_states_on_material_state_id"
  end

  create_table "decisions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "decided_at"
    t.datetime "for_review_at"
    t.text "situation"
    t.text "decision"
    t.text "alternatives"
    t.text "problem_statement"
    t.text "variables"
    t.text "complications"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "expectations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "decision_id", null: false
    t.text "description"
    t.decimal "likelihood"
    t.decimal "desirability"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["decision_id"], name: "index_expectations_on_decision_id"
  end

  create_table "material_states", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "outcomes", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "decision_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["decision_id"], name: "index_outcomes_on_decision_id"
  end

  add_foreign_key "decision_material_states", "decisions"
  add_foreign_key "decision_material_states", "material_states"
  add_foreign_key "expectations", "decisions"
  add_foreign_key "outcomes", "decisions"
end
