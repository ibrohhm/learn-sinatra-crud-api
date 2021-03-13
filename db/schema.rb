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

ActiveRecord::Schema.define(version: 20200106010101) do

  create_table "products", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.integer  "price",       limit: 8
    t.text     "description", limit: 65535
    t.boolean  "active",                    default: false
    t.integer  "stock",       limit: 4,     default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "produk", id: false, force: :cascade do |t|
    t.string "kode",  limit: 30, null: false
    t.string "nama",  limit: 30, null: false
    t.float  "harga", limit: 24
  end

end
