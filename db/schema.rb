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


ActiveRecord::Schema.define(version: 20150721015757) do

  create_table "addresses", force: :cascade do |t|
    t.string   "address1"
    t.string   "address2"
    t.integer  "city_id"
    t.integer  "state_id"
    t.integer  "country_id"
    t.string   "postal_code"
    t.integer  "addressable_id"
    t.string   "addressable_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "addresses", ["city_id"], name: "index_addresses_on_city_id"
  add_index "addresses", ["country_id"], name: "index_addresses_on_country_id"
  add_index "addresses", ["state_id"], name: "index_addresses_on_state_id"

  create_table "area_categories", force: :cascade do |t|
    t.string   "name"
    t.text     "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "area_to_area_categories", force: :cascade do |t|
    t.integer  "area_id"
    t.integer  "area_category_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "area_to_area_categories", ["area_category_id"], name: "index_area_to_area_categories_on_area_category_id"
  add_index "area_to_area_categories", ["area_id"], name: "index_area_to_area_categories_on_area_id"

  create_table "areas", force: :cascade do |t|
    t.string   "name"
    t.integer  "program_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.integer  "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "cities", ["state_id"], name: "index_cities_on_state_id"

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

<<<<<<< HEAD
  create_table "faculties", force: :cascade do |t|
    t.integer  "program_id"
    t.string   "name"
    t.string   "email"
    t.string   "intro"
    t.string   "link_url"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "faculties", ["program_id"], name: "index_faculties_on_program_id"

  create_table "faculty_areas", force: :cascade do |t|
    t.integer  "faculty_id"
    t.integer  "area_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "faculty_areas", ["area_id"], name: "index_faculty_areas_on_area_id"
  add_index "faculty_areas", ["faculty_id"], name: "index_faculty_areas_on_faculty_id"

  create_table "photos", force: :cascade do |t|
    t.string   "photo_link_type"
    t.integer  "photo_link_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

=======
  create_table "experiences", force: :cascade do |t|
    t.integer  "profile_id"
    t.integer  "serial"
    t.string   "institude"
    t.string   "title"
    t.date     "date_from"
    t.date     "date_to"
    t.string   "etype"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "experiences", ["profile_id"], name: "index_experiences_on_profile_id"

  create_table "honors", force: :cascade do |t|
    t.integer  "profile_id"
    t.integer  "serial"
    t.string   "title"
    t.date     "get_date"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "honors", ["profile_id"], name: "index_honors_on_profile_id"

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.date     "birthday"
    t.string   "major"
    t.string   "research_area"
    t.integer  "toefl_read"
    t.integer  "toefl_listen"
    t.integer  "toefl_speak"
    t.integer  "toefl_write"
    t.integer  "toefl_total"
    t.integer  "gre_verbal"
    t.integer  "gre_guantitatiue"
    t.integer  "gre_awa"
    t.integer  "gre_total"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id"

>>>>>>> 7fcb7cb2dc4d531104d138d423f3524f0f34aa28
  create_table "program_form_keys", force: :cascade do |t|
    t.string   "name"
    t.string   "desc"
    t.integer  "order"
    t.integer  "program_id"
    t.string   "key_type"
    t.string   "list_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "program_form_keys", ["program_id"], name: "index_program_form_keys_on_program_id"

  create_table "programs", force: :cascade do |t|
    t.string   "name"
    t.string   "degree"
    t.string   "level"
    t.string   "desc"
    t.string   "department"
    t.string   "fax"
    t.string   "phone"
    t.string   "email"
    t.integer  "address_id"
    t.integer  "school_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "programs", ["address_id"], name: "index_programs_on_address_id"
  add_index "programs", ["school_id"], name: "index_programs_on_school_id"

  create_table "publications", force: :cascade do |t|
    t.integer  "profile_id"
    t.integer  "serial"
    t.string   "title"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "publications", ["profile_id"], name: "index_publications_on_profile_id"

  create_table "schools", force: :cascade do |t|
    t.string   "name"
    t.string   "campus"
    t.text     "desc"
    t.string   "phone"
    t.string   "email"
    t.integer  "logo_id"
    t.integer  "address_id"
    t.string   "link_name"
    t.string   "link_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "schools", ["address_id"], name: "index_schools_on_address_id"
  add_index "schools", ["logo_id"], name: "index_schools_on_logo_id"

  create_table "states", force: :cascade do |t|
    t.string   "name"
    t.integer  "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "states", ["country_id"], name: "index_states_on_country_id"

  create_table "user_program_form_values", force: :cascade do |t|
    t.integer  "user_program_form_id"
    t.integer  "user_program_form_key_id"
    t.string   "content"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "user_program_form_values", ["user_program_form_id"], name: "index_user_program_form_values_on_user_program_form_id"
  add_index "user_program_form_values", ["user_program_form_key_id"], name: "index_user_program_form_values_on_user_program_form_key_id"

  create_table "user_program_forms", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "program_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_program_forms", ["program_id"], name: "index_user_program_forms_on_program_id"
  add_index "user_program_forms", ["user_id"], name: "index_user_program_forms_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "prefered_name"
    t.string   "username"
    t.string   "sex"
    t.date     "birthday"
    t.string   "phone"
    t.integer  "address_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["address_id"], name: "index_users_on_address_id"
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
