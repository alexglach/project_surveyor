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

ActiveRecord::Schema.define(version: 20160809164914) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "multiple_choice_questions", force: :cascade do |t|
    t.boolean  "one_answer"
    t.text     "question_text"
    t.integer  "survey_id"
    t.boolean  "required"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["survey_id"], name: "index_multiple_choice_questions_on_survey_id", using: :btree
  end

  create_table "options", force: :cascade do |t|
    t.string   "answer"
    t.integer  "multiple_choice_question_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["multiple_choice_question_id"], name: "index_options_on_multiple_choice_question_id", using: :btree
  end

  create_table "range_questions", force: :cascade do |t|
    t.integer  "survey_id"
    t.string   "range_min"
    t.string   "range_max"
    t.string   "step"
    t.text     "question_text"
    t.boolean  "required"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["survey_id"], name: "index_range_questions_on_survey_id", using: :btree
  end

  create_table "responses", force: :cascade do |t|
    t.string   "answer"
    t.string   "responsable_type"
    t.integer  "responsable_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["responsable_type", "responsable_id"], name: "index_responses_on_responsable_type_and_responsable_id", using: :btree
  end

  create_table "surveys", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_foreign_key "multiple_choice_questions", "surveys"
  add_foreign_key "options", "multiple_choice_questions"
  add_foreign_key "range_questions", "surveys"
end
