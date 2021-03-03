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

ActiveRecord::Schema.define(version: 2021_03_01_231502) do

  create_table "active_storage_attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "courses", id: :integer, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.decimal "name", precision: 8, scale: 2, null: false
    t.text "description", null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "fk_routes_users_idx"
  end

  create_table "locations", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.decimal "latitude", precision: 10, scale: 8, default: "0.0", null: false
    t.decimal "longitude", precision: 11, scale: 8, default: "0.0", null: false
    t.integer "user_id"
    t.integer "course_id"
    t.index ["course_id"], name: "fk_locations_courses1_idx"
    t.index ["user_id"], name: "fk_locations_users1_idx"
  end

  create_table "params", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.text "name", null: false
    t.text "value", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products_users", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "product_id", null: false
    t.integer "user_id", null: false
    t.index ["product_id"], name: "fk_products_has_users_products1_idx"
    t.index ["user_id"], name: "fk_products_has_users_users1_idx"
  end

  create_table "users", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "level", default: 2, null: false, comment: "1 - Admin \\n 2 - Vendedor  \\n 3 - Cliente "
    t.string "name", null: false
    t.string "email", limit: 45, null: false
    t.string "password_digest", null: false
    t.decimal "credit", precision: 8, scale: 2, default: "1.0", null: false
    t.string "phone", limit: 45
    t.integer "status", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "courses", "users", name: "fk_routes_users"
  add_foreign_key "locations", "courses", name: "fk_locations_routes1"
  add_foreign_key "locations", "users", name: "fk_locations_users1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "products_users", "products", name: "fk_products_has_users_products1"
  add_foreign_key "products_users", "users", name: "fk_products_has_users_users1"
end
