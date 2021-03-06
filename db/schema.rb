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

ActiveRecord::Schema.define(version: 20150731105107) do

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

  create_table "alumns", force: :cascade do |t|
    t.integer  "profile_id"
    t.string   "program_degree"
    t.string   "program_year"
    t.string   "admission"
    t.string   "background"
    t.string   "recommendation"
    t.text     "description"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "alumns", ["profile_id"], name: "index_alumns_on_profile_id"

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

  create_table "auto_compeletes", force: :cascade do |t|
    t.string   "name"
    t.string   "associated"
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
    t.string   "title"
    t.text     "education"
    t.text     "publication"
    t.text     "funding"
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

  create_table "form_key_categories", force: :cascade do |t|
    t.string   "name"
    t.string   "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "form_keys", force: :cascade do |t|
    t.string   "name"
    t.string   "note"
    t.integer  "form_key_category_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "key_type"
    t.string   "profile_column"
    t.integer  "auto_compelete_id"
  end

  add_index "form_keys", ["form_key_category_id"], name: "index_form_keys_on_form_key_category_id"

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

  create_table "program_alumnships", force: :cascade do |t|
    t.integer  "program_id"
    t.integer  "alumn_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "program_alumnships", ["alumn_id"], name: "index_program_alumnships_on_alumn_id"
  add_index "program_alumnships", ["program_id"], name: "index_program_alumnships_on_program_id"

  create_table "program_areaships", force: :cascade do |t|
    t.integer  "area_id"
    t.integer  "program_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "program_areaships", ["area_id"], name: "index_program_areaships_on_area_id"
  add_index "program_areaships", ["program_id"], name: "index_program_areaships_on_program_id"

  create_table "program_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "program_form_key_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "program_form_keys", force: :cascade do |t|
    t.string   "name"
    t.string   "desc"
    t.integer  "order"
    t.integer  "program_id"
    t.string   "list_value"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "form_key_id"
  end

  add_index "program_form_keys", ["form_key_id"], name: "index_program_form_keys_on_form_key_id"
  add_index "program_form_keys", ["program_id"], name: "index_program_form_keys_on_program_id"

  create_table "programs", force: :cascade do |t|
    t.string   "degree"
    t.string   "level"
    t.string   "desc"
    t.string   "department"
    t.string   "fax"
    t.string   "phone"
    t.string   "email"
    t.integer  "school_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "program_category_id"
    t.string   "title"
    t.integer  "ranking"
    t.integer  "tuition"
    t.date     "deadline"
    t.integer  "applicant"
  end

  add_index "programs", ["program_category_id"], name: "index_programs_on_program_category_id"
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
    t.string   "link_name"
    t.string   "link_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "program_form_key_id"
    t.text     "note"
    t.boolean  "check"
    t.integer  "form_key_category_id"
  end

  add_index "user_program_form_values", ["form_key_category_id"], name: "index_user_program_form_values_on_form_key_category_id"
  add_index "user_program_form_values", ["program_form_key_id"], name: "index_user_program_form_values_on_program_form_key_id"
  add_index "user_program_form_values", ["user_program_form_id"], name: "index_user_program_form_values_on_user_program_form_id"

  create_table "user_program_forms", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "program_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "percen",     default: 0
  end

  add_index "user_program_forms", ["percen"], name: "index_user_program_forms_on_percen"
  add_index "user_program_forms", ["program_id"], name: "index_user_program_forms_on_program_id"
  add_index "user_program_forms", ["user_id"], name: "index_user_program_forms_on_user_id"

  create_table "user_updates", force: :cascade do |t|
    t.string   "user_updatable_type"
    t.integer  "user_updatable_id"
    t.integer  "user_id"
    t.string   "action"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "user_updates", ["user_id"], name: "index_user_updates_on_user_id"
  add_index "user_updates", ["user_updatable_id"], name: "index_user_updates_on_user_updatable_id"

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
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "auth_provider"
    t.string   "auth_uid"
    t.string   "auth_token"
    t.text     "auth_raw_data"
  end

  add_index "users", ["address_id"], name: "index_users_on_address_id"
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
