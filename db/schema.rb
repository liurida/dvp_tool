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

ActiveRecord::Schema.define(:version => 20130303140925) do

  create_table "comments", :force => true do |t|
    t.integer  "commentable_id",   :default => 0
    t.string   "commentable_type", :default => ""
    t.string   "title",            :default => ""
    t.text     "body",             :default => ""
    t.string   "subject",          :default => ""
    t.integer  "user_id",          :default => 0,  :null => false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  add_index "comments", ["commentable_id"], :name => "index_comments_on_commentable_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "domains", :force => true do |t|
    t.string   "name"
    t.string   "desc"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "dvps", :force => true do |t|
    t.integer  "study_id"
    t.integer  "domain_id"
    t.string   "seq_num"
    t.string   "description"
    t.string   "check_method"
    t.string   "check_type"
    t.string   "review_type"
    t.string   "query_message"
    t.string   "memo"
    t.string   "proc_name"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "program_status"
    t.string   "test_status"
  end

  add_index "dvps", ["domain_id"], :name => "index_dvps_on_domain_id"
  add_index "dvps", ["study_id"], :name => "index_dvps_on_study_id"

  create_table "studies", :force => true do |t|
    t.string   "study_code"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "testings", :force => true do |t|
    t.integer  "dvp_id"
    t.integer  "requested_by_id"
    t.datetime "requested_at"
    t.string   "request_comment"
    t.integer  "tested_by_id"
    t.datetime "tested_at"
    t.string   "test_passed_yn"
    t.string   "test_comment"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "testings", ["dvp_id"], :name => "index_testings_on_dvp_id"
  add_index "testings", ["requested_by_id"], :name => "index_testings_on_requested_by_id"
  add_index "testings", ["tested_by_id"], :name => "index_testings_on_tested_by_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
