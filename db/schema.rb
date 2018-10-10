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

ActiveRecord::Schema.define(version: 2018_10_10_060615) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "loaded_unfair_suppliers", force: :cascade do |t|
    t.string "name"
    t.string "number"
    t.text "files_array", array: true
    t.boolean "downloaded"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_loaded_unfair_suppliers_on_name", unique: true
  end

  create_table "nsi_placing_ways", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.boolean "actual"
    t.string "placing_way_type"
    t.boolean "is_procedure"
    t.jsonb "data"
    t.boolean "used_in_rpg", default: false
    t.boolean "rpg_joint", default: false
    t.bigint "placing_way_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["placing_way_id"], name: "index_nsi_placing_ways_on_placing_way_id", unique: true
  end

  create_table "nsi_special_purchases", force: :cascade do |t|
    t.bigint "special_purchase_id"
    t.string "code"
    t.text "short_name"
    t.text "full_name"
    t.boolean "actual", default: false
    t.text "tender_plan2017_short"
    t.text "tender_plan_2017_full"
    t.jsonb "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["special_purchase_id"], name: "index_nsi_special_purchases_on_special_purchase_id", unique: true
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
    t.index ["inn"], name: "index_unfair_suppliers_on_inn", unique: true
    t.index ["loaded_unfair_supplier_id"], name: "index_unfair_suppliers_on_loaded_unfair_supplier_id"
    t.index ["registry_num"], name: "index_unfair_suppliers_on_registry_num", unique: true
  end

  add_foreign_key "unfair_suppliers", "loaded_unfair_suppliers"
end
