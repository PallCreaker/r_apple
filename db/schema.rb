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

ActiveRecord::Schema.define(version: 20140922175305) do

  create_table "competitions", force: true do |t|
    t.integer  "user_id"
    t.integer  "enemy_id"
    t.boolean  "is_fin",     default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "competitions", ["enemy_id"], name: "index_competitions_on_enemy_id", using: :btree
  add_index "competitions", ["user_id"], name: "index_competitions_on_user_id", using: :btree

  create_table "messages", force: true do |t|
    t.integer  "from_id"
    t.integer  "competition_id"
    t.integer  "to_id"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["from_id"], name: "index_messages_on_from_id", using: :btree
  add_index "messages", ["to_id"], name: "index_messages_on_to_id", using: :btree

  create_table "quizzes", force: true do |t|
    t.string   "problem"
    t.string   "ans1"
    t.string   "ans2"
    t.string   "ans3"
    t.string   "ans4"
    t.integer  "correct_count",   default: 1
    t.integer  "incorrect_count", default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "results", force: true do |t|
    t.integer  "competition_id"
    t.integer  "my_score_id"
    t.integer  "competition_score_id"
    t.boolean  "decision"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "results", ["competition_id"], name: "index_results_on_competition_id", using: :btree
  add_index "results", ["competition_score_id"], name: "index_results_on_competition_score_id", using: :btree
  add_index "results", ["my_score_id"], name: "index_results_on_my_score_id", using: :btree

  create_table "scores", force: true do |t|
    t.integer  "user_id"
    t.integer  "competition_id"
    t.integer  "score",          default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "scores", ["competition_id"], name: "index_scores_on_competition_id", using: :btree
  add_index "scores", ["user_id"], name: "index_scores_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "user_name"
    t.string   "status",                 default: "tmp"
    t.string   "gender"
    t.string   "university"
    t.string   "image"
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "fb_id",                  default: "",    null: false
    t.string   "provider",               default: "",    null: false
    t.string   "fb_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["fb_id", "provider"], name: "index_users_on_fb_id_and_provider", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
