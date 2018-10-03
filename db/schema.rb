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

ActiveRecord::Schema.define(version: 2018_09_24_120001) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "loaded_unfair_suppliers", force: :cascade do |t|
    t.string "name"
    t.string "number"
    t.boolean "downloaded"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "unfair_suppliers", force: :cascade do |t|
    t.string "registry_num"
    t.date "publish_date"
    t.date "approve_date"
    t.string "state"
    t.string "full_name"
    t.string "view"
    t.string "firm_name"
    t.string "inn"
    t.jsonb "data"
    t.bigint "loaded_unfair_supplier_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["loaded_unfair_supplier_id"], name: "index_unfair_suppliers_on_loaded_unfair_supplier_id"
  end

  add_foreign_key "unfair_suppliers", "loaded_unfair_suppliers"
end
