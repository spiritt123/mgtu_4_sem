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

ActiveRecord::Schema.define(version: 2021_03_08_034340) do

  create_table "bar_code_companies", force: :cascade do |t|
    t.string "code_co"
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["code_co"], name: "index_bar_code_companies_on_code_co", unique: true
  end

  create_table "bar_code_countries", force: :cascade do |t|
    t.string "code_c"
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["code_c"], name: "index_bar_code_countries_on_code_c", unique: true
  end

  create_table "bar_code_products", force: :cascade do |t|
    t.string "code_p"
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["code_p"], name: "index_bar_code_products_on_code_p", unique: true
  end

  create_table "products", force: :cascade do |t|
    t.string "id_p"
    t.string "title"
    t.string "barcode"
    t.integer "massa"
    t.string "production"
    t.string "expiration"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["id_p"], name: "index_products_on_id_p", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "patronymic"
    t.integer "rights"
    t.string "iduser"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
