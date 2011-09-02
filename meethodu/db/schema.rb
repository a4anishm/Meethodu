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

ActiveRecord::Schema.define(:version => 20110902063808) do

  create_table "donor_requests", :force => true do |t|
    t.integer  "project_id"
    t.boolean  "sent"
    t.date     "sent_date"
    t.integer  "sent_money"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friendships", :force => true do |t|
    t.integer  "friend1_id"
    t.integer  "friend2_id"
    t.date     "begin_date"
    t.string   "how_do_you_know"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "project_fundings", :force => true do |t|
    t.integer  "project_id"
    t.integer  "receiver_id"
    t.integer  "recommender_id"
    t.integer  "donor_id"
    t.date     "funding_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.string   "summary"
    t.text     "description"
    t.integer  "minimum_budget"
    t.integer  "maximum_budget"
    t.integer  "days_to_return_money"
    t.boolean  "need_referral"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "receiver_requests", :force => true do |t|
    t.integer  "project_id"
    t.boolean  "received"
    t.date     "received_date"
    t.integer  "received_money"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "test_products", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "image_url"
    t.decimal  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gender"
    t.string   "address_line1"
    t.string   "address_line2"
    t.string   "city"
    t.string   "state"
    t.integer  "zipcode"
    t.string   "user_id"
    t.text     "about_me"
    t.text     "interests"
    t.date     "date_of_birth"
    t.string   "area_code"
    t.string   "phone_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
