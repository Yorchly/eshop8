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

ActiveRecord::Schema.define(version: 20180508102306) do

  create_table "cart_items", force: :cascade do |t|
    t.integer  "program_id", limit: 4
    t.integer  "cart_id",    limit: 4
    t.float    "price",      limit: 24
    t.integer  "amount",     limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "developers", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "program_id", limit: 4
    t.integer  "order_id",   limit: 4
    t.float    "price",      limit: 24
    t.integer  "amount",     limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "order_items", ["order_id"], name: "fk_order_items_orders", using: :btree

  create_table "orders", force: :cascade do |t|
    t.string   "email",                limit: 255
    t.string   "phone_number",         limit: 255
    t.string   "ship_to_first_name",   limit: 255
    t.string   "ship_to_last_name",    limit: 255
    t.string   "ship_to_address",      limit: 255
    t.string   "ship_to_city",         limit: 255
    t.string   "ship_to_postal_code",  limit: 255
    t.string   "ship_to_country_code", limit: 255
    t.string   "customer_ip",          limit: 255
    t.string   "status",               limit: 255
    t.string   "error_message",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "programs", force: :cascade do |t|
    t.string   "name",                     limit: 255,   null: false
    t.string   "kind",                     limit: 255,   null: false
    t.integer  "developer_id",             limit: 4,     null: false
    t.datetime "developed_at"
    t.string   "serial_number",            limit: 5
    t.text     "blurb",                    limit: 65535
    t.float    "price",                    limit: 24
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cover_image_file_name",    limit: 255
    t.string   "cover_image_content_type", limit: 255
    t.integer  "cover_image_file_size",    limit: 4
    t.datetime "cover_image_updated_at"
  end

  add_index "programs", ["developer_id"], name: "fk_programs_developers", using: :btree

  create_table "programs_suppliers", force: :cascade do |t|
    t.integer  "supplier_id", limit: 4, null: false
    t.integer  "program_id",  limit: 4, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "programs_suppliers", ["program_id"], name: "fk_programs_suppliers_programs", using: :btree
  add_index "programs_suppliers", ["supplier_id"], name: "fk_programs_suppliers_suppliers", using: :btree

  create_table "suppliers", force: :cascade do |t|
    t.string   "first_name", limit: 255, null: false
    t.string   "last_name",  limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_foreign_key "order_items", "orders", name: "fk_order_items_orders", on_delete: :cascade
  add_foreign_key "programs", "developers", name: "fk_programs_developers", on_delete: :cascade
  add_foreign_key "programs_suppliers", "programs", name: "fk_programs_suppliers_programs", on_delete: :cascade
  add_foreign_key "programs_suppliers", "suppliers", name: "fk_programs_suppliers_suppliers", on_delete: :cascade
end
