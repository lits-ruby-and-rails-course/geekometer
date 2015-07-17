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

ActiveRecord::Schema.define(version: 20150717114231) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "answers", force: :cascade do |t|
    t.integer  "question_id"
    t.integer  "question_quiz_id"
    t.text     "solution"
    t.boolean  "answer_valid"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id"
  add_index "answers", ["question_quiz_id"], name: "index_answers_on_question_quiz_id"

  create_table "question_quizzes", force: :cascade do |t|
    t.text     "condition"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.text     "condition"
    t.integer  "difficulty"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "topic_id"
  end

  add_index "questions", ["topic_id"], name: "index_questions_on_topic_id"

  create_table "technologies", force: :cascade do |t|
    t.string   "name"
    t.string   "logo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "test_suit_answers", force: :cascade do |t|
    t.integer  "test_suit_id"
    t.integer  "answer_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "test_suit_answers", ["answer_id"], name: "index_test_suit_answers_on_answer_id"
  add_index "test_suit_answers", ["test_suit_id"], name: "index_test_suit_answers_on_test_suit_id"

  create_table "test_suits", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "test_suits", ["user_id"], name: "index_test_suits_on_user_id"

  create_table "test_suits_questions", force: :cascade do |t|
    t.integer "test_suit_id"
    t.integer "question_id"
  end

  add_index "test_suits_questions", ["question_id"], name: "index_test_suits_questions_on_question_id"
  add_index "test_suits_questions", ["test_suit_id"], name: "index_test_suits_questions_on_test_suit_id"

  create_table "topics", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.boolean  "admin"
    t.string   "avatar"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
