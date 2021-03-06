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

ActiveRecord::Schema.define(version: 2020_08_29_200457) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "candidate_preferred_job_types", force: :cascade do |t|
    t.bigint "candidate_id", null: false
    t.bigint "job_type_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["candidate_id", "job_type_id"], name: "index_candidate_preferred_job_types_on_candidate_and_job_type", unique: true
    t.index ["candidate_id"], name: "index_candidate_preferred_job_types_on_candidate_id"
    t.index ["job_type_id"], name: "index_candidate_preferred_job_types_on_job_type_id"
  end

  create_table "candidate_preferred_locations", force: :cascade do |t|
    t.bigint "candidate_id", null: false
    t.bigint "district_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["candidate_id", "district_id"], name: "index_candidate_preferred_locations_on_candidate_and_district", unique: true
    t.index ["candidate_id"], name: "index_candidate_preferred_locations_on_candidate_id"
    t.index ["district_id"], name: "index_candidate_preferred_locations_on_district_id"
  end

  create_table "candidate_working_hours", force: :cascade do |t|
    t.bigint "candidate_id", null: false
    t.datetime "starts_at", null: false
    t.datetime "ends_at", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["candidate_id"], name: "index_candidate_working_hours_on_candidate_id"
  end

  create_table "candidates", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_candidates_on_email", unique: true
  end

  create_table "districts", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_districts_on_name", unique: true
  end

  create_table "job_types", force: :cascade do |t|
    t.string "title", null: false
    t.text "description", null: false
    t.string "slug", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["slug"], name: "index_job_types_on_slug", unique: true
  end

  create_table "jobs", force: :cascade do |t|
    t.string "title", null: false
    t.text "description", null: false
    t.integer "location_id", null: false
    t.bigint "job_type_id"
    t.datetime "starts_at", null: false
    t.datetime "ends_at", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["job_type_id"], name: "index_jobs_on_job_type_id"
  end

  add_foreign_key "candidate_preferred_job_types", "candidates"
  add_foreign_key "candidate_preferred_job_types", "job_types"
  add_foreign_key "candidate_preferred_locations", "candidates"
  add_foreign_key "candidate_preferred_locations", "districts"
  add_foreign_key "candidate_working_hours", "candidates"
end
