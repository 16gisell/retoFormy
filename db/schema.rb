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

ActiveRecord::Schema[7.1].define(version: 2024_04_08_215512) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "api_features", force: :cascade do |t|
    t.string "tipo"
    t.string "titulo"
    t.string "url"
    t.string "place"
    t.string "id_feature"
    t.string "mag_type"
    t.decimal "coord_latitud"
    t.decimal "coord_longitud"
    t.decimal "magnitud"
    t.text "comment", default: [], array: true
    t.string "time"
    t.boolean "tsunami"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
