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

ActiveRecord::Schema.define(version: 20160522101506) do

  create_table "forms", force: :cascade do |t|
    t.integer "rule"
    t.string  "suffix"
    t.string  "tag"
  end

  add_index "forms", ["suffix"], name: "index_forms_on_suffix"

  create_table "forms_tags", id: false, force: :cascade do |t|
    t.integer "tag_id"
    t.integer "form_id"
  end

  add_index "forms_tags", ["form_id"], name: "index_forms_tags_on_form_id"
  add_index "forms_tags", ["tag_id"], name: "index_forms_tags_on_tag_id"

  create_table "norms", force: :cascade do |t|
    t.integer "rule"
    t.string  "suffix"
    t.string  "tag"
  end

  create_table "norms_tags", id: false, force: :cascade do |t|
    t.integer "tag_id"
    t.integer "norm_id"
  end

  add_index "norms_tags", ["norm_id"], name: "index_norms_tags_on_norm_id"
  add_index "norms_tags", ["tag_id"], name: "index_norms_tags_on_tag_id"

  create_table "stems", force: :cascade do |t|
    t.integer "rule"
    t.string  "prefix"
  end

  add_index "stems", ["prefix"], name: "index_stems_on_prefix"

  create_table "tags", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "code",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tags", ["name", "code"], name: "index_tags_on_name_and_code", unique: true

end
