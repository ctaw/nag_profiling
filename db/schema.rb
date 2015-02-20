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

ActiveRecord::Schema.define(version: 20150220053248) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "church_involvement", force: true do |t|
    t.integer  "member_id"
    t.datetime "date_joined"
    t.integer  "children_ministry"
    t.integer  "christ_ambassadors"
    t.integer  "young_professional"
    t.integer  "men_ministry"
    t.integer  "women_ministry"
    t.integer  "music_ministry"
    t.integer  "pulpit_ministry"
    t.integer  "board_of_trustees"
    t.integer  "church_council"
    t.integer  "church_staff"
    t.integer  "full_time"
    t.integer  "part_time"
    t.integer  "volunteer"
    t.integer  "pastoral_staff"
    t.integer  "campus_ministry"
    t.integer  "evangelism"
    t.integer  "discipleship"
    t.integer  "worship"
    t.integer  "fellowship"
    t.integer  "ministry"
    t.integer  "special"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "family_groups", force: true do |t|
    t.string   "family_last_name"
    t.integer  "no_of_members"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "members", force: true do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "name_extension"
    t.integer  "age"
    t.datetime "birthdate"
    t.string   "birthplace"
    t.text     "address"
    t.integer  "civil_status"
    t.string   "occupation"
    t.string   "email"
    t.datetime "date_accepted_christ"
    t.datetime "date_baptized_in_water"
    t.datetime "date_baptized_in_spirit"
    t.integer  "family_id"
    t.integer  "relationship_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "positions", force: true do |t|
    t.integer  "member_id"
    t.integer  "member"
    t.integer  "leader"
    t.integer  "senior_or_lead_pastor"
    t.integer  "executive_pastor"
    t.integer  "assistant_pastor"
    t.integer  "associate_pastor"
    t.integer  "adviser_or_overseer"
    t.integer  "church_secretary"
    t.integer  "church_treasurer"
    t.integer  "youth_pastor"
    t.integer  "worship_pastor"
    t.integer  "campus_pastor"
    t.integer  "small_group_pastor"
    t.integer  "children_pastor"
    t.integer  "children_superintendent"
    t.integer  "young_pro_pastor"
    t.integer  "mission_pastor"
    t.integer  "family_pastor"
    t.integer  "campus_ministry"
    t.integer  "deacon"
    t.integer  "president"
    t.integer  "vice_president"
    t.integer  "secretary"
    t.integer  "treasurer"
    t.integer  "auditor"
    t.integer  "pro"
    t.integer  "membership_status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
