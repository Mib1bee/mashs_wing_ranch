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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121120212436) do

  create_table "admin_users", :force => true do |t|
    t.string   "first_name",      :limit => 25
    t.string   "last_name",       :limit => 50
    t.string   "email",           :limit => 100
    t.string   "username",        :limit => 25
    t.string   "salt",            :limit => 40
    t.string   "hashed_password", :limit => 40
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  add_index "admin_users", ["username"], :name => "index_admin_users_on_username"

  create_table "characters", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.float    "longitude"
    t.float    "latitude"
    t.boolean  "gmaps"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "franchises", :force => true do |t|
    t.string   "title",                  :limit => 15
    t.string   "first_name",             :limit => 50
    t.string   "second_name",            :limit => 50
    t.string   "address_line_1",         :limit => 100
    t.string   "address_line_2",         :limit => 100
    t.string   "town_city",              :limit => 100
    t.string   "postcode",               :limit => 10
    t.string   "country",                :limit => 100
    t.string   "email",                  :limit => 100
    t.string   "telephone",              :limit => 25
    t.string   "investment"
    t.string   "location_country"
    t.string   "location_town_city"
    t.string   "timeframe",              :limit => 100
    t.string   "preferred_contact",                     :default => "Telephone"
    t.string   "preferred_contact_time", :limit => 50
    t.string   "alternative_telephone",  :limit => 25
    t.text     "extra"
    t.datetime "created_at",                                                     :null => false
    t.datetime "updated_at",                                                     :null => false
  end

  create_table "mailing_lists", :force => true do |t|
    t.string   "first_name",   :limit => 50
    t.string   "second_name",  :limit => 50
    t.string   "email",        :limit => 100
    t.string   "company_name", :limit => 100
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  create_table "menus", :force => true do |t|
    t.string   "category",    :limit => 100
    t.boolean  "core",                       :default => true
    t.string   "item"
    t.text     "description"
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
  end

  add_index "menus", ["category"], :name => "index_menus_on_category"
  add_index "menus", ["item"], :name => "index_menus_on_item"

  create_table "ranches", :force => true do |t|
    t.string   "name",           :limit => 100
    t.string   "address_line_1", :limit => 100
    t.string   "address_line_2", :limit => 100
    t.string   "town_city",      :limit => 100
    t.string   "postcode",       :limit => 10
    t.string   "telephone",      :limit => 25
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
    t.string   "longitude"
    t.string   "latitude"
    t.boolean  "gmaps",                         :default => false
  end

  add_index "ranches", ["name"], :name => "index_ranches_on_name"
  add_index "ranches", ["postcode"], :name => "index_ranches_on_postcode"

  create_table "sauces", :force => true do |t|
    t.string   "name",               :limit => 50
    t.text     "description"
    t.integer  "heat_level",         :limit => 1
    t.string   "pic_url"
    t.string   "title_colour",       :limit => 10
    t.string   "description_colour", :limit => 10
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  add_index "sauces", ["name"], :name => "index_sauces_on_name"

end
