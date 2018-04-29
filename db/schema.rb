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

ActiveRecord::Schema.define(version: 2018_04_29_211928) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "communications", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.string "followup"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "communications_deliveries", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "communication_id"
    t.uuid "invitee_id"
    t.string "state"
    t.datetime "sent_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["communication_id"], name: "index_communications_deliveries_on_communication_id"
    t.index ["invitee_id"], name: "index_communications_deliveries_on_invitee_id"
  end

  create_table "communications_questions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "communication_id", null: false
    t.string "prompt"
    t.string "css_class"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["communication_id"], name: "index_communications_questions_on_communication_id"
  end

  create_table "communications_responses", force: :cascade do |t|
    t.uuid "party_id"
    t.uuid "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["party_id"], name: "index_communications_responses_on_party_id"
    t.index ["question_id"], name: "index_communications_responses_on_question_id"
  end

  create_table "invitees", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "party_id", null: false
    t.string "firstname", null: false
    t.string "lastname", null: false
    t.string "phone"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["party_id"], name: "index_invitees_on_party_id"
  end

  create_table "parties", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "code", null: false
    t.integer "invitees_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "category"
    t.string "priority"
    t.index ["category"], name: "index_parties_on_category"
    t.index ["code"], name: "index_parties_on_code"
    t.index ["priority"], name: "index_parties_on_priority"
  end

end
