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

ActiveRecord::Schema[7.2].define(version: 2025_04_03_163828) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "collaborators", force: :cascade do |t|
    t.bigint "admin_id", null: false
    t.string "user_tag", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id", "user_tag"], name: "index_collaborators_on_admin_id_and_user_tag", unique: true
    t.index ["admin_id"], name: "index_collaborators_on_admin_id"
  end

  create_table "module_properties", force: :cascade do |t|
    t.bigint "production_module_id", null: false
    t.bigint "property_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["production_module_id"], name: "index_module_properties_on_production_module_id"
    t.index ["property_id"], name: "index_module_properties_on_property_id"
  end

  create_table "production_modules", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "active", default: false, null: false
    t.json "settings", default: {}
    t.integer "module_type", default: 0, null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_production_modules_on_user_id"
  end

  create_table "properties", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "size"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_properties_on_user_id"
  end

  create_table "property_accesses", force: :cascade do |t|
    t.bigint "property_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_property_accesses_on_property_id"
    t.index ["user_id"], name: "index_property_accesses_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "name", default: "", null: false
    t.string "phone_number", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.integer "role", default: 1, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "tag"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["tag"], name: "index_users_on_tag", unique: true
  end

  add_foreign_key "collaborators", "users", column: "admin_id"
  add_foreign_key "module_properties", "production_modules"
  add_foreign_key "module_properties", "properties"
  add_foreign_key "production_modules", "users"
  add_foreign_key "properties", "users"
  add_foreign_key "property_accesses", "properties"
  add_foreign_key "property_accesses", "users"
end
