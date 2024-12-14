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

ActiveRecord::Schema[8.0].define(version: 2024_12_12_064510) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "circles", force: :cascade do |t|
    t.bigint "owner_id", null: false
    t.text "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_circles_on_name"
    t.index ["owner_id"], name: "index_circles_on_owner_id"
  end

  create_table "item_works", force: :cascade do |t|
    t.bigint "item_id", null: false
    t.bigint "work_id", null: false
    t.integer "work_count", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id", "work_id"], name: "index_item_works_on_item_id_and_work_id", unique: true
    t.index ["item_id"], name: "index_item_works_on_item_id"
    t.index ["work_count"], name: "index_item_works_on_work_count"
    t.index ["work_id"], name: "index_item_works_on_work_id"
  end

  create_table "items", force: :cascade do |t|
    t.bigint "space_id", null: false
    t.text "name", null: false
    t.bigint "price", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_items_on_name"
    t.index ["price"], name: "index_items_on_price"
    t.index ["space_id"], name: "index_items_on_space_id"
  end

  create_table "payment_item_works", force: :cascade do |t|
    t.bigint "payment_item_id", null: false
    t.bigint "work_id", null: false
    t.text "name", null: false
    t.integer "count", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["count"], name: "index_payment_item_works_on_count"
    t.index ["name"], name: "index_payment_item_works_on_name"
    t.index ["payment_item_id", "work_id"], name: "index_payment_item_works_on_payment_item_id_and_work_id", unique: true
    t.index ["payment_item_id"], name: "index_payment_item_works_on_payment_item_id"
    t.index ["work_id"], name: "index_payment_item_works_on_work_id"
  end

  create_table "payment_items", force: :cascade do |t|
    t.bigint "payment_id", null: false
    t.bigint "item_id", null: false
    t.bigint "space_id", null: false
    t.text "name", null: false
    t.bigint "price", null: false
    t.integer "count", null: false
    t.text "space_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["count"], name: "index_payment_items_on_count"
    t.index ["item_id"], name: "index_payment_items_on_item_id"
    t.index ["name"], name: "index_payment_items_on_name"
    t.index ["payment_id"], name: "index_payment_items_on_payment_id"
    t.index ["price"], name: "index_payment_items_on_price"
    t.index ["space_id"], name: "index_payment_items_on_space_id"
    t.index ["space_name"], name: "index_payment_items_on_space_name"
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "circle_id", null: false
    t.bigint "price", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["circle_id"], name: "index_payments_on_circle_id"
    t.index ["price"], name: "index_payments_on_price"
  end

  create_table "space_works", force: :cascade do |t|
    t.bigint "space_id", null: false
    t.bigint "work_id", null: false
    t.integer "work_count", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["space_id", "work_id"], name: "index_space_works_on_space_id_and_work_id", unique: true
    t.index ["space_id"], name: "index_space_works_on_space_id"
    t.index ["work_count"], name: "index_space_works_on_work_count"
    t.index ["work_id"], name: "index_space_works_on_work_id"
  end

  create_table "spaces", force: :cascade do |t|
    t.bigint "circle_id", null: false
    t.text "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["circle_id"], name: "index_spaces_on_circle_id"
    t.index ["name"], name: "index_spaces_on_name"
  end

  create_table "users", force: :cascade do |t|
    t.text "email", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["name"], name: "index_users_on_name"
  end

  create_table "works", force: :cascade do |t|
    t.bigint "circle_id", null: false
    t.text "name", null: false
    t.bigint "standard_price", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["circle_id"], name: "index_works_on_circle_id"
    t.index ["name"], name: "index_works_on_name"
    t.index ["standard_price"], name: "index_works_on_standard_price"
  end

  add_foreign_key "circles", "users", column: "owner_id"
  add_foreign_key "item_works", "items"
  add_foreign_key "item_works", "works"
  add_foreign_key "items", "spaces"
  add_foreign_key "payment_item_works", "payment_items"
  add_foreign_key "payment_item_works", "works"
  add_foreign_key "payment_items", "items"
  add_foreign_key "payment_items", "payments"
  add_foreign_key "payment_items", "spaces"
  add_foreign_key "payments", "circles"
  add_foreign_key "space_works", "spaces"
  add_foreign_key "space_works", "works"
  add_foreign_key "spaces", "circles"
  add_foreign_key "works", "circles"
end
