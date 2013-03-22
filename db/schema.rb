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

ActiveRecord::Schema.define(:version => 20130322080119) do

  create_table "administrators", :force => true do |t|
    t.string   "name",                                   :null => false
    t.string   "email",                                  :null => false
    t.datetime "deleted_at"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "administrators", ["email"], :name => "index_administrators_on_email", :unique => true
  add_index "administrators", ["reset_password_token"], :name => "index_administrators_on_reset_password_token", :unique => true

  create_table "contact_statuses", :force => true do |t|
    t.text     "name"
    t.integer  "contact_status_code"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "contacts", :force => true do |t|
    t.integer  "partner_id",                       :null => false
    t.text     "subject"
    t.text     "body"
    t.integer  "contact_status_id", :default => 1
    t.text     "memo"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  create_table "domain_templates", :force => true do |t|
    t.string   "name",       :null => false
    t.text     "xml_data",   :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "faq_categories", :force => true do |t|
    t.text     "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "faqs", :force => true do |t|
    t.string   "question",        :null => false
    t.text     "answer",          :null => false
    t.string   "tag"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "faq_category_id"
  end

  add_index "faqs", ["faq_category_id"], :name => "index_faqs_on_faq_category_id"

  create_table "notifications", :force => true do |t|
    t.text     "title",       :null => false
    t.text     "body",        :null => false
    t.date     "released_at"
    t.date     "expired_at"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "partner_operation_logs", :force => true do |t|
    t.integer  "partner_id"
    t.text     "url"
    t.text     "ip_address"
    t.text     "useragent"
    t.text     "request_method"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "partners", :force => true do |t|
    t.string   "name"
    t.string   "name_kana"
    t.string   "address"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
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
    t.string   "phone_number1"
    t.string   "phone_number2"
    t.string   "fax_number"
  end

  add_index "partners", ["email"], :name => "index_partners_on_email", :unique => true
  add_index "partners", ["reset_password_token"], :name => "index_partners_on_reset_password_token", :unique => true

  create_table "private_servers", :force => true do |t|
    t.integer  "partner_id",          :null => false
    t.string   "name",                :null => false
    t.text     "memo"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "tag"
    t.string   "private_server_code", :null => false
  end

  add_index "private_servers", ["private_server_code"], :name => "index_private_servers_on_private_server_code", :length => {"private_server_code"=>10}
  add_index "private_servers", ["tag"], :name => "index_private_servers_on_tag", :length => {"tag"=>10}

end
