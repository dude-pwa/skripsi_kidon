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

ActiveRecord::Schema.define(version: 20160723093652) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bobots", force: :cascade do |t|
    t.integer  "w1"
    t.integer  "w2"
    t.integer  "w3"
    t.integer  "w4"
    t.integer  "w5"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coaches", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
    t.string   "role"
  end

  add_index "coaches", ["email"], name: "index_coaches_on_email", unique: true, using: :btree
  add_index "coaches", ["reset_password_token"], name: "index_coaches_on_reset_password_token", unique: true, using: :btree

  create_table "criteria", force: :cascade do |t|
    t.float    "tinggi_badan"
    t.float    "berat_badan"
    t.float    "kecepatan_berlari"
    t.string   "akurasi_tendangan"
    t.float    "prestasi"
    t.integer  "member_id"
    t.integer  "group_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "criteria", ["group_id"], name: "index_criteria_on_group_id", using: :btree
  add_index "criteria", ["member_id"], name: "index_criteria_on_member_id", using: :btree

  create_table "groups", force: :cascade do |t|
    t.string   "posisi"
    t.text     "keterangan"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", force: :cascade do |t|
    t.string   "nama"
    t.text     "alamat"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.date     "tanggal_lahir"
    t.string   "handphone"
  end

  create_table "rekap_data", force: :cascade do |t|
    t.string   "nama"
    t.date     "tanggal_lahir"
    t.text     "alamat"
    t.string   "handphone"
    t.string   "posisi"
    t.float    "nilai"
    t.integer  "ranking"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_foreign_key "criteria", "groups"
  add_foreign_key "criteria", "members"
end
