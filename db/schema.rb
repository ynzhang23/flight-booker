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

ActiveRecord::Schema[7.0].define(version: 2023_05_31_093205) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "airports", force: :cascade do |t|
    t.string "airport_id"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "flights", force: :cascade do |t|
    t.string "flight_no"
    t.bigint "depart_id", null: false
    t.bigint "arrive_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "departing_time"
    t.index ["arrive_id"], name: "index_flights_on_arrive_id"
    t.index ["depart_id"], name: "index_flights_on_depart_id"
  end

  create_table "flights_passengers", id: false, force: :cascade do |t|
    t.bigint "flight_id", null: false
    t.bigint "passenger_id", null: false
    t.index ["flight_id"], name: "index_flights_passengers_on_flight_id"
    t.index ["passenger_id"], name: "index_flights_passengers_on_passenger_id"
  end

  create_table "passengers", force: :cascade do |t|
    t.string "name"
    t.string "passport_no"
    t.string "nationality"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "flights", "airports", column: "arrive_id"
  add_foreign_key "flights", "airports", column: "depart_id"
end
