# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_11_11_134419) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "card_fields", force: :cascade do |t|
    t.bigint "card_id"
    t.integer "order"
    t.string "content_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_card_fields_on_card_id"
  end

  create_table "cards", force: :cascade do |t|
    t.string "title"
    t.bigint "user_id"
    t.boolean "is_map"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_cards_on_user_id"
  end

  create_table "coordinates", force: :cascade do |t|
    t.bigint "card_id"
    t.bigint "map_id"
    t.float "lat"
    t.float "long"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_coordinates_on_card_id"
    t.index ["map_id"], name: "index_coordinates_on_map_id"
  end

  create_table "image_fields", force: :cascade do |t|
    t.bigint "card_field_id"
    t.string "image_url"
    t.string "image_title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_field_id"], name: "index_image_fields_on_card_field_id"
  end

  create_table "link_fields", force: :cascade do |t|
    t.bigint "card_field_id"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_field_id"], name: "index_link_fields_on_card_field_id"
  end

  create_table "maps", force: :cascade do |t|
    t.bigint "card_id"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_maps_on_card_id"
  end

  create_table "taggings", force: :cascade do |t|
    t.bigint "tag_id"
    t.bigint "card_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_taggings_on_card_id"
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tags_on_user_id"
  end

  create_table "text_fields", force: :cascade do |t|
    t.bigint "card_field_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_field_id"], name: "index_text_fields_on_card_field_id"
  end

  create_table "timestamps", force: :cascade do |t|
    t.date "date"
    t.bigint "card_id"
    t.bigint "timestamp_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_timestamps_on_card_id"
    t.index ["timestamp_id"], name: "index_timestamps_on_timestamp_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "card_fields", "cards"
  add_foreign_key "cards", "users"
  add_foreign_key "coordinates", "cards"
  add_foreign_key "coordinates", "maps"
  add_foreign_key "image_fields", "card_fields"
  add_foreign_key "link_fields", "card_fields"
  add_foreign_key "maps", "cards"
  add_foreign_key "taggings", "cards"
  add_foreign_key "taggings", "tags"
  add_foreign_key "tags", "users"
  add_foreign_key "text_fields", "card_fields"
  add_foreign_key "timestamps", "cards"
  add_foreign_key "timestamps", "timestamps"
end
