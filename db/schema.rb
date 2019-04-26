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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 2019_04_25_223355) do
=======
ActiveRecord::Schema.define(version: 2019_04_25_215753) do
>>>>>>> feaa5673ded41b46ee72f8292fdda0d78caaf462

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "albums", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.string "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "associations", force: :cascade do |t|
    t.bigint "album_id"
    t.bigint "song_id"
    t.bigint "artist_id"
    t.index ["album_id"], name: "index_associations_on_album_id"
    t.index ["artist_id"], name: "index_associations_on_artist_id"
    t.index ["song_id"], name: "index_associations_on_song_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.string "ratingable_type"
    t.bigint "ratingable_id"
    t.bigint "user_id"
    t.integer "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ratingable_type", "ratingable_id"], name: "index_ratings_on_ratingable_type_and_ratingable_id"
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end
  
  create_table "providers", force: :cascade do |t|
    t.string "name"
    t.string "uid"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_providers_on_user_id"
  end

  create_table "songs", force: :cascade do |t|
    t.string "title"
    t.integer "duration"
    t.integer "progress"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role", default: "regular"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "associations", "albums"
  add_foreign_key "associations", "artists"
  add_foreign_key "associations", "songs"
<<<<<<< HEAD
  add_foreign_key "ratings", "users"
=======
  add_foreign_key "providers", "users"
>>>>>>> feaa5673ded41b46ee72f8292fdda0d78caaf462
end
