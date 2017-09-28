# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20170621005323) do

  create_table "accounts", force: :cascade do |t|
    t.string   "address",    limit: 255
    t.decimal  "balance",                precision: 24, default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "balance_subscriptions", force: :cascade do |t|
    t.integer  "account_id",    limit: 4
    t.integer  "subscriber_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "end_at"
    t.string   "xid",           limit: 255
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   limit: 4,     default: 0, null: false
    t.integer  "attempts",   limit: 4,     default: 0, null: false
    t.text     "handler",    limit: 65535,             null: false
    t.text     "last_error", limit: 65535
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by",  limit: 255
    t.string   "queue",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "event_subscription_notifications", force: :cascade do |t|
    t.integer  "event_id",              limit: 4
    t.integer  "event_subscription_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "event_subscriptions", force: :cascade do |t|
    t.integer  "subscriber_id",     limit: 4
    t.integer  "filter_config_id",  limit: 4
    t.datetime "end_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "filter",            limit: 255
    t.string   "xid",               limit: 255
    t.integer  "last_block_height", limit: 4,   default: 0
  end

  create_table "event_topics", force: :cascade do |t|
    t.integer  "topic_id",   limit: 4
    t.integer  "event_id",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: :cascade do |t|
    t.integer  "account_id",        limit: 4
    t.string   "block_hash",        limit: 255
    t.integer  "block_number",      limit: 4
    t.string   "data",              limit: 255
    t.integer  "log_index",         limit: 4
    t.string   "transaction_hash",  limit: 255
    t.integer  "transaction_index", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "filter_configs", force: :cascade do |t|
    t.integer  "account_id", limit: 4
    t.integer  "from_block", limit: 4
    t.integer  "to_block",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "filter_topics", force: :cascade do |t|
    t.integer  "topic_id",         limit: 4
    t.integer  "filter_config_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subscribers", force: :cascade do |t|
    t.text     "notification_url", limit: 65535
    t.string   "xid",              limit: 255
    t.string   "api_key",          limit: 255
    t.string   "notifier_id",      limit: 255
    t.string   "notifier_key",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "api_id",           limit: 255
  end

  create_table "topics", force: :cascade do |t|
    t.string   "topic",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
