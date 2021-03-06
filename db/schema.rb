# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20081129220314) do

  create_table "collections", :force => true do |t|
    t.string   "title",                          :default => "", :null => false
    t.string   "description",    :limit => 3000, :default => "", :null => false
    t.string   "image_filename"
    t.integer  "sequence"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "colors", :force => true do |t|
    t.string   "title"
    t.string   "image_filename"
    t.integer  "sequence"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "phone"
    t.string   "email"
    t.integer  "type_id"
    t.integer  "color_id"
    t.integer  "style_id"
    t.string   "inquiry",    :limit => 600, :default => "", :null => false
    t.integer  "captcha"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "engravings", :force => true do |t|
    t.string   "title",          :default => ""
    t.string   "image_filename"
    t.integer  "sequence"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pens", :force => true do |t|
    t.integer  "style_id"
    t.string   "image_filename"
    t.integer  "sequence"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "styles", :force => true do |t|
    t.integer  "collection_id",                                  :null => false
    t.string   "title",                          :default => "", :null => false
    t.string   "description",    :limit => 3000, :default => "", :null => false
    t.string   "image_filename"
    t.integer  "sequence"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "types", :force => true do |t|
    t.string   "title",      :default => ""
    t.integer  "sequence"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
