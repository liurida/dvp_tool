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

ActiveRecord::Schema.define(:version => 20130226132146) do

  create_table "auto_check_tests", :force => true do |t|
    t.integer  "auto_check_id"
    t.string   "programmed_yn"
    t.integer  "programmed_by_id"
    t.string   "programmed_at"
    t.string   "validation_passed_yn"
    t.integer  "validated_by_id"
    t.string   "validated_at"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "auto_check_tests", ["auto_check_id"], :name => "index_auto_check_tests_on_auto_check_id"
  add_index "auto_check_tests", ["programmed_by_id"], :name => "index_auto_check_tests_on_programmed_by_id"
  add_index "auto_check_tests", ["validated_by_id"], :name => "index_auto_check_tests_on_validated_by_id"

  create_table "auto_checks", :force => true do |t|
    t.integer  "edit_check_info_id"
    t.string   "check_type"
    t.string   "proc_name"
    t.string   "query_message"
    t.string   "review_type"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "auto_checks", ["edit_check_info_id"], :name => "index_auto_checks_on_edit_check_info_id"

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

  create_table "dvp_links", :force => true do |t|
    t.integer  "edit_check_info_id"
    t.string   "check_type"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "dvp_links", ["edit_check_info_id"], :name => "index_dvp_links_on_edit_check_info_id"

  create_table "edit_check_infos", :force => true do |t|
    t.integer  "study_id"
    t.integer  "domain_id"
    t.string   "serials_num"
    t.string   "description"
    t.string   "linked_domain"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "check_type"
  end

  add_index "edit_check_infos", ["domain_id"], :name => "index_edit_check_infos_on_domain_id"
  add_index "edit_check_infos", ["study_id"], :name => "index_edit_check_infos_on_study_id"

  create_table "studies", :force => true do |t|
    t.string   "study_code"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

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
