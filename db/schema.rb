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

ActiveRecord::Schema.define(:version => 20121104035321) do

  create_table "blogs", :force => true do |t|
    t.string   "title"
    t.text     "text"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "comments", :force => true do |t|
    t.integer  "blog_id"
    t.text     "text"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "courses", :force => true do |t|
    t.string   "course_name"
    t.string   "course_category"
    t.text     "course_overview"
    t.text     "tutor_bio"
    t.text     "expected_results"
    t.integer  "number_of_lessons"
    t.integer  "level_id"
    t.integer  "price_cents"
    t.integer  "category_id"
    t.integer  "publisher_id"
    t.string   "youtube_thumb"
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
    t.integer  "position"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.boolean  "published",                 :default => false
    t.string   "course_image_file_name"
    t.string   "course_image_content_type"
    t.integer  "course_image_file_size"
    t.datetime "course_image_updated_at"
  end

  create_table "enrolments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "course_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "stripe_charge_id"
    t.integer  "payment_recipient_id"
  end

  create_table "exercises", :force => true do |t|
    t.integer  "lesson_id"
    t.string   "multiple_choice_question"
    t.text     "written_question"
    t.text     "practical_exercise"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "lessons", :force => true do |t|
    t.integer  "lesson_number"
    t.string   "lesson_name"
    t.text     "lesson_overview"
    t.text     "youtube_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "video_file_name"
    t.string   "video_type"
    t.integer  "video_file_size"
    t.datetime "video_updated_at"
    t.integer  "course_id"
    t.text     "lesson_practical"
    t.string   "vimeo_id"
    t.integer  "position"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "audio_file_name"
    t.string   "audio_content_type"
    t.integer  "audio_file_size"
    t.datetime "audio_updated_at"
    t.string   "panda_video_id"
    t.string   "file_url"
  end

  create_table "levels", :force => true do |t|
    t.integer  "number"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "payments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "enrolment_id"
    t.datetime "purchased_at"
    t.integer  "price_cents"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.integer  "month"
    t.integer  "year"
    t.integer  "publisher_id"
    t.integer  "publisher_payment_id"
    t.integer  "publisher_price_cents"
  end

  add_index "payments", ["month"], :name => "index_payments_on_month"
  add_index "payments", ["publisher_id", "publisher_payment_id"], :name => "index_payments_on_publisher_id_and_publisher_payment_id"
  add_index "payments", ["publisher_price_cents"], :name => "index_payments_on_publisher_price_cents"
  add_index "payments", ["year"], :name => "index_payments_on_year"

  create_table "publisher_payments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "price_cents"
    t.datetime "purchased_at"
    t.datetime "due_date"
    t.boolean  "paid"
    t.datetime "paid_at"
    t.integer  "enrolment_id"
    t.string   "paypal"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.boolean  "admin",                  :default => false
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "paypal"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

end
