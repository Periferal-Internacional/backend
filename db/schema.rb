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

ActiveRecord::Schema[7.0].define(version: 2022_05_11_125621) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "active_storage_attachments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.uuid "record_id", null: false
    t.uuid "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "deliverables", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "user_id", null: false
    t.boolean "approved", default: false, null: false
    t.text "comment"
    t.string "deliverable_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", default: ""
    t.string "url", default: ""
    t.integer "grade", default: 0
    t.index ["user_id"], name: "index_deliverables_on_user_id"
  end

  create_table "documentations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "doc_type", null: false
    t.uuid "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_documentations_on_user_id"
  end

  create_table "plants", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "city", null: false
    t.string "country", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", default: ""
  end

  create_table "questions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "prompt", null: false
    t.string "right_answer", null: false
    t.string "answers", default: [], array: true
    t.string "question_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "xp", default: 0
    t.string "game_over_message", default: "¡Esa no fue la respuesta correcta!"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "name"
    t.string "lastName1"
    t.string "lastName2"
    t.string "position"
    t.boolean "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "super_user", default: false
    t.uuid "plant_id", null: false
    t.integer "xp_ji", default: 0
    t.integer "xp_jr", default: 0
    t.integer "xp_jm", default: 0
    t.string "business", default: ""
    t.string "general_area", default: ""
    t.string "superior_department", default: ""
    t.string "department", default: ""
    t.integer "arca_id", default: 0
    t.string "email", default: ""
    t.integer "cap_operators", default: 0
    t.integer "total_operators", default: 1
    t.integer "mdp_b4", default: 1
    t.integer "mdp_aft", default: 1
    t.integer "waste_b4", default: 1
    t.integer "waste_aft", default: 1
    t.integer "format_b4", default: 1
    t.integer "format_aft", default: 1
    t.integer "improvements", default: 1
    t.index ["plant_id"], name: "index_users_on_plant_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "deliverables", "users"
  add_foreign_key "documentations", "users"
  add_foreign_key "users", "plants"
end
