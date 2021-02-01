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

ActiveRecord::Schema.define(version: 2021_02_01_015327) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "automated_tweets", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "twitter_account_id"
    t.string "body"
    t.datetime "stop_at"
    t.integer "post_interval"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0
    t.integer "tweet_count", default: 0
    t.index ["twitter_account_id"], name: "index_automated_tweets_on_twitter_account_id"
    t.index ["user_id"], name: "index_automated_tweets_on_user_id"
  end

  create_table "tweets", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "twitter_account_id"
    t.text "body"
    t.datetime "publish_at"
    t.string "tweet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["twitter_account_id"], name: "index_tweets_on_twitter_account_id"
    t.index ["user_id"], name: "index_tweets_on_user_id"
  end

  create_table "twitter_accounts", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.string "username"
    t.string "image"
    t.string "token"
    t.string "secret"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_twitter_accounts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "automated_tweets", "twitter_accounts"
  add_foreign_key "automated_tweets", "users"
  add_foreign_key "tweets", "twitter_accounts"
  add_foreign_key "tweets", "users"
  add_foreign_key "twitter_accounts", "users"
end
