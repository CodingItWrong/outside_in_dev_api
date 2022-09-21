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

ActiveRecord::Schema[7.0].define(version: 2022_09_21_105841) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applications", force: :cascade do |t|
    t.string "apiKey", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["apiKey"], name: "index_applications_on_apiKey", unique: true
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.bigint "application_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["application_id"], name: "index_movies_on_application_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "application_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["application_id"], name: "index_restaurants_on_application_id"
  end

  add_foreign_key "movies", "applications"
  add_foreign_key "restaurants", "applications"
end
