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

ActiveRecord::Schema.define(version: 2018_01_19_143014) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "artifacts", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.integer "user_id"
    t.index ["user_id"], name: "index_artifacts_on_user_id"
  end

  create_table "artifacts_features", id: false, force: :cascade do |t|
    t.integer "artifact_id", null: false
    t.integer "feature_id", null: false
    t.index ["artifact_id"], name: "index_artifacts_features_on_artifact_id"
    t.index ["feature_id"], name: "index_artifacts_features_on_feature_id"
  end

  create_table "features", force: :cascade do |t|
    t.integer "project_id"
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "orig_feature_id"
    t.index ["orig_feature_id"], name: "index_features_on_orig_feature_id"
    t.index ["project_id"], name: "index_features_on_project_id"
  end

  create_table "features_passages", id: false, force: :cascade do |t|
    t.integer "feature_id", null: false
    t.integer "passage_id", null: false
    t.index ["feature_id"], name: "index_features_passages_on_feature_id"
    t.index ["passage_id"], name: "index_features_passages_on_passage_id"
  end

  create_table "features_products", id: false, force: :cascade do |t|
    t.integer "feature_id", null: false
    t.integer "product_id", null: false
    t.index ["feature_id"], name: "index_features_products_on_feature_id"
    t.index ["product_id"], name: "index_features_products_on_product_id"
  end

  create_table "passages", force: :cascade do |t|
    t.integer "artifact_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.text "description"
    t.integer "user_id"
    t.index ["artifact_id"], name: "index_passages_on_artifact_id"
    t.index ["user_id"], name: "index_passages_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.integer "project_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.integer "orig_product_id"
    t.index ["orig_product_id"], name: "index_products_on_orig_product_id"
    t.index ["project_id"], name: "index_products_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.integer "orig_project_id"
    t.index ["orig_project_id"], name: "index_projects_on_orig_project_id"
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "security_questions", force: :cascade do |t|
    t.string "locale"
    t.string "question"
    t.string "answer"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.text "description"
    t.boolean "is_admin", default: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "image"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "artifacts", "users"
  add_foreign_key "features", "projects"
  add_foreign_key "passages", "users"
  add_foreign_key "products", "projects"
  add_foreign_key "projects", "users"
end
