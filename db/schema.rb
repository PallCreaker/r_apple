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

ActiveRecord::Schema.define(version: 20140911090631) do

  create_table "competitions", force: true do |t|
    t.integer  "user_id"
    t.integer  "competition_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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

  create_table "scores", force: true do |t|
    t.integer  "user_id"
    t.integer  "competition_id"
    t.integer  "score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "user_name"
    t.string   "fb_id"
    t.string   "fb_name"
    t.integer  "status"
    t.integer  "conpetition"
    t.string   "university"
    t.string   "e_mail"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
