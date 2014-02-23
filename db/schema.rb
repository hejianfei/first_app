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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140223072129) do

  create_table "forecasters", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "mobile"
    t.string   "qq"
    t.integer  "state"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "replies", :force => true do |t|
    t.integer  "topic_id",                  :null => false
    t.text     "content",                   :null => false
    t.integer  "user_id"
    t.integer  "is_valid",   :default => 1
    t.integer  "top",        :default => 0
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "topics", :force => true do |t|
    t.string   "title",                      :null => false
    t.text     "content",                    :null => false
    t.integer  "user_id"
    t.integer  "category_id"
    t.integer  "feedback",    :default => 0
    t.integer  "reply_count", :default => 0
    t.integer  "state",       :default => 1
    t.integer  "views",       :default => 0
    t.integer  "top",         :default => 0
    t.integer  "essence",     :default => 0
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "password"
    t.string   "email"
    t.integer  "mobile"
    t.integer  "admin",         :limit => 1, :default => 0
    t.string   "ip"
    t.integer  "state",         :limit => 1, :default => 1
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.integer  "is_forecaster",              :default => 0
  end

end
