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

ActiveRecord::Schema.define(version: 2020_05_13_122007) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "comments", force: :cascade do |t|
    t.string "comment", null: false
    t.integer "post_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "passport_psychologies", force: :cascade do |t|
    t.integer "passport_id"
    t.integer "psychology_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["passport_id"], name: "index_passport_psychologies_on_passport_id"
    t.index ["psychology_id"], name: "index_passport_psychologies_on_psychology_id"
  end

  create_table "passports", force: :cascade do |t|
    t.string "purpose", null: false
    t.string "goal", null: false
    t.string "passport_image"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "genre_id"
    t.integer "rate"
    t.integer "week_rate"
    t.boolean "achievement"
    t.integer "month_rate"
    t.index ["genre_id"], name: "index_passports_on_genre_id"
    t.index ["user_id"], name: "index_passports_on_user_id"
  end

  create_table "photos", force: :cascade do |t|
    t.string "post_image"
    t.integer "post_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_photos_on_post_id"
  end

  create_table "plans", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer "passport_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["passport_id"], name: "index_plans_on_passport_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.string "discription"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "psychologies", force: :cascade do |t|
    t.string "title"
    t.string "discription"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "psychology_image"
  end

  create_table "schedules", force: :cascade do |t|
    t.datetime "day"
    t.boolean "comprate"
    t.integer "passport_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["passport_id"], name: "index_schedules_on_passport_id"
    t.index ["user_id"], name: "index_schedules_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", default: "", null: false
    t.string "profile_image"
    t.boolean "admin_flg"
    t.boolean "email_magazine", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true, where: "(deleted_at IS NULL)"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
