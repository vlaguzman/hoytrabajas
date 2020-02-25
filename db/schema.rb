# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_02_25_154250) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "citext"
  enable_extension "plpgsql"
  enable_extension "unaccent"

  create_table "acknowledgments", force: :cascade do |t|
    t.string "title"
    t.date "start_date"
    t.string "entity_name"
    t.bigint "curriculum_vitae_id", null: false
    t.bigint "curriculum_vitaes_id"
    t.bigint "city_id"
    t.index ["city_id"], name: "index_acknowledgments_on_city_id"
    t.index ["curriculum_vitae_id"], name: "index_acknowledgments_on_curriculum_vitae_id"
    t.index ["curriculum_vitaes_id"], name: "index_acknowledgments_on_curriculum_vitaes_id"
  end

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "age_ranges", force: :cascade do |t|
    t.integer "from"
    t.integer "to"
    t.bigint "offer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["offer_id"], name: "index_age_ranges_on_offer_id"
  end

  create_table "applied_offer_statuses", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "applied_offers", force: :cascade do |t|
    t.datetime "applied_date"
    t.bigint "offer_id", null: false
    t.bigint "curriculum_vitae_id", null: false
    t.bigint "applied_offer_status_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "curriculum_vitaes_id"
    t.index ["applied_offer_status_id"], name: "index_applied_offers_on_applied_offer_status_id"
    t.index ["curriculum_vitae_id"], name: "index_applied_offers_on_curriculum_vitae_id"
    t.index ["curriculum_vitaes_id"], name: "index_applied_offers_on_curriculum_vitaes_id"
    t.index ["offer_id"], name: "index_applied_offers_on_offer_id"
  end

  create_table "available_work_days", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "available_work_days_curriculum_vitaes", force: :cascade do |t|
    t.integer "curriculum_vitae_id"
    t.integer "available_work_day_id"
    t.index ["available_work_day_id"], name: "cv_av_work_day_av_work_day_id"
    t.index ["curriculum_vitae_id"], name: "cv_av_work_day_cv_id"
  end

  create_table "available_work_days_offers", force: :cascade do |t|
    t.bigint "available_work_day_id", null: false
    t.bigint "offer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["available_work_day_id"], name: "index_available_work_days_offers_on_available_work_day_id"
    t.index ["offer_id"], name: "index_available_work_days_offers_on_offer_id"
  end

  create_table "cities", force: :cascade do |t|
    t.citext "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "state_id"
    t.index ["state_id"], name: "index_cities_on_state_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "contact_name"
    t.string "cellphone"
    t.string "contact_cellphone"
    t.string "nit"
    t.string "address"
    t.string "web_site"
    t.string "contact_web_site"
    t.string "description"
    t.string "contact_work_position"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "employees_range_id"
    t.bigint "city_id"
    t.bigint "industry_id"
    t.index ["city_id"], name: "index_companies_on_city_id"
    t.index ["confirmation_token"], name: "index_companies_on_confirmation_token", unique: true
    t.index ["email"], name: "index_companies_on_email", unique: true
    t.index ["employees_range_id"], name: "index_companies_on_employees_range_id"
    t.index ["industry_id"], name: "index_companies_on_industry_id"
    t.index ["reset_password_token"], name: "index_companies_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_companies_on_unlock_token", unique: true
  end

  create_table "companies_users", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_companies_users_on_company_id"
    t.index ["user_id"], name: "index_companies_users_on_user_id"
  end

  create_table "company_transitions", force: :cascade do |t|
    t.string "to_state", null: false
    t.json "metadata", default: {}
    t.integer "sort_key", null: false
    t.integer "company_id", null: false
    t.boolean "most_recent", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id", "most_recent"], name: "index_company_transitions_parent_most_recent", unique: true, where: "most_recent"
    t.index ["company_id", "sort_key"], name: "index_company_transitions_parent_sort", unique: true
  end

  create_table "contract_types", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "currencies", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "curriculum_vitae_salaries", force: :cascade do |t|
    t.bigint "curriculum_vitae_id", null: false
    t.bigint "salary_period_id", null: false
    t.bigint "currency_id", null: false
    t.integer "from"
    t.integer "to"
    t.index ["currency_id"], name: "index_curriculum_vitae_salaries_on_currency_id"
    t.index ["curriculum_vitae_id"], name: "index_curriculum_vitae_salaries_on_curriculum_vitae_id"
    t.index ["salary_period_id"], name: "index_curriculum_vitae_salaries_on_salary_period_id"
  end

  create_table "curriculum_vitaes", force: :cascade do |t|
    t.string "area_code"
    t.string "about_me"
    t.datetime "release_date"
    t.boolean "travel_disponibility"
    t.string "visits_count"
    t.bigint "user_id"
    t.bigint "city_id"
    t.bigint "labor_disponibility_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "work_mode_id"
    t.bigint "contract_type_id"
    t.index ["city_id"], name: "index_curriculum_vitaes_on_city_id"
    t.index ["contract_type_id"], name: "index_curriculum_vitaes_on_contract_type_id"
    t.index ["labor_disponibility_id"], name: "index_curriculum_vitaes_on_labor_disponibility_id"
    t.index ["user_id"], name: "index_curriculum_vitaes_on_user_id"
    t.index ["work_mode_id"], name: "index_curriculum_vitaes_on_work_mode_id"
  end

  create_table "curriculum_vitaes_educational_degrees", force: :cascade do |t|
    t.string "curriculum_vitae_id"
    t.string "educational_degree_id"
    t.index ["curriculum_vitae_id"], name: "cv_id", unique: true
    t.index ["educational_degree_id"], name: "edu_degree_id", unique: true
  end

  create_table "curriculum_vitaes_job_categories", force: :cascade do |t|
    t.bigint "curriculum_vitae_id", null: false
    t.bigint "job_category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["curriculum_vitae_id"], name: "index_curriculum_vitaes_job_categories_on_curriculum_vitae_id"
    t.index ["job_category_id"], name: "index_curriculum_vitaes_job_categories_on_job_category_id"
  end

  create_table "curriculum_vitaes_languages", force: :cascade do |t|
    t.bigint "curriculum_vitae_id", null: false
    t.bigint "language_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "level_id", null: false
    t.index ["curriculum_vitae_id"], name: "index_curriculum_vitaes_languages_on_curriculum_vitae_id"
    t.index ["language_id"], name: "index_curriculum_vitaes_languages_on_language_id"
    t.index ["level_id"], name: "index_curriculum_vitaes_languages_on_level_id"
  end

  create_table "curriculum_vitaes_offer_types", force: :cascade do |t|
    t.bigint "curriculum_vitae_id", null: false
    t.bigint "offer_type_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["curriculum_vitae_id"], name: "index_curriculum_vitaes_offer_types_on_curriculum_vitae_id"
    t.index ["offer_type_id"], name: "index_curriculum_vitaes_offer_types_on_offer_type_id"
  end

  create_table "curriculum_vitaes_soft_skills", force: :cascade do |t|
    t.bigint "curriculum_vitae_id", null: false
    t.bigint "soft_skill_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "curriculum_vitaes_id"
    t.index ["curriculum_vitae_id"], name: "index_curriculum_vitaes_soft_skills_on_curriculum_vitae_id"
    t.index ["curriculum_vitaes_id"], name: "index_curriculum_vitaes_soft_skills_on_curriculum_vitaes_id"
    t.index ["soft_skill_id"], name: "index_curriculum_vitaes_soft_skills_on_soft_skill_id"
  end

  create_table "curriculum_vitaes_technical_skills", force: :cascade do |t|
    t.boolean "step_up"
    t.bigint "job_category_id", null: false
    t.bigint "curriculum_vitae_id", null: false
    t.bigint "technical_skill_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "level_id"
    t.index ["curriculum_vitae_id"], name: "index_curriculum_vitaes_technical_skills_on_curriculum_vitae_id"
    t.index ["job_category_id"], name: "index_curriculum_vitaes_technical_skills_on_job_category_id"
    t.index ["level_id"], name: "index_curriculum_vitaes_technical_skills_on_level_id"
    t.index ["technical_skill_id"], name: "index_curriculum_vitaes_technical_skills_on_technical_skill_id"
  end

  create_table "curriculum_vitaes_vehicles", force: :cascade do |t|
    t.bigint "curriculum_vitae_id", null: false
    t.bigint "vehicle_id", null: false
    t.index ["curriculum_vitae_id"], name: "index_curriculum_vitaes_vehicles_on_curriculum_vitae_id"
    t.index ["vehicle_id"], name: "index_curriculum_vitaes_vehicles_on_vehicle_id"
  end

  create_table "curriculum_vitaes_work_modes", force: :cascade do |t|
    t.bigint "curriculum_vitae_id", null: false
    t.bigint "work_mode_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["curriculum_vitae_id"], name: "index_curriculum_vitaes_work_modes_on_curriculum_vitae_id"
    t.index ["work_mode_id"], name: "index_curriculum_vitaes_work_modes_on_work_mode_id"
  end

  create_table "curriculum_vitaes_working_days", force: :cascade do |t|
    t.bigint "curriculum_vitae_id", null: false
    t.bigint "working_day_id", null: false
    t.index ["curriculum_vitae_id"], name: "index_curriculum_vitaes_working_days_on_curriculum_vitae_id"
    t.index ["working_day_id"], name: "index_curriculum_vitaes_working_days_on_working_day_id"
  end

  create_table "document_types", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "driving_licences", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "driving_licences_offers", force: :cascade do |t|
    t.bigint "offer_id", null: false
    t.bigint "driving_licence_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["driving_licence_id"], name: "index_driving_licences_offers_on_driving_licence_id"
    t.index ["offer_id"], name: "index_driving_licences_offers_on_offer_id"
  end

  create_table "driving_licences_users", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "driving_licence_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["driving_licence_id"], name: "index_driving_licences_users_on_driving_licence_id"
    t.index ["user_id"], name: "index_driving_licences_users_on_user_id"
  end

  create_table "duration_types", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "educational_degrees", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "educational_degrees_users", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "educational_degree_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["educational_degree_id"], name: "index_educational_degrees_users_on_educational_degree_id"
    t.index ["user_id"], name: "index_educational_degrees_users_on_user_id"
  end

  create_table "educational_levels", force: :cascade do |t|
    t.string "institution_name"
    t.date "start_date"
    t.date "finish_date"
    t.string "degree"
    t.boolean "ongoing_study"
    t.string "city_id"
    t.string "curriculum_vitae_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["city_id"], name: "index_educational_levels_on_city_id"
    t.index ["curriculum_vitae_id"], name: "index_educational_levels_on_curriculum_vitae_id"
  end

  create_table "educational_levels_offers", force: :cascade do |t|
    t.bigint "educational_level_id", null: false
    t.bigint "offer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["educational_level_id"], name: "index_educational_levels_offers_on_educational_level_id"
    t.index ["offer_id"], name: "index_educational_levels_offers_on_offer_id"
  end

  create_table "employees_ranges", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "functions", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "functions_offers", force: :cascade do |t|
    t.bigint "offer_id", null: false
    t.bigint "function_id", null: false
    t.index ["function_id"], name: "index_functions_offers_on_function_id"
    t.index ["offer_id"], name: "index_functions_offers_on_offer_id"
  end

  create_table "industries", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "job_aids", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "job_aids_offers", force: :cascade do |t|
    t.bigint "job_aid_id", null: false
    t.bigint "offer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["job_aid_id"], name: "index_job_aids_offers_on_job_aid_id"
    t.index ["offer_id"], name: "index_job_aids_offers_on_offer_id"
  end

  create_table "job_categories", force: :cascade do |t|
    t.citext "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image"
  end

  create_table "job_categories_offers", id: false, force: :cascade do |t|
    t.bigint "offer_id", null: false
    t.bigint "job_category_id", null: false
    t.index ["offer_id", "job_category_id"], name: "index_job_categories_offers_on_offer_id_and_job_category_id", unique: true
  end

  create_table "labor_disponibilities", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "languages", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "languages_offers", force: :cascade do |t|
    t.bigint "language_id", null: false
    t.bigint "offer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "level_id", null: false
    t.index ["language_id"], name: "index_languages_offers_on_language_id"
    t.index ["level_id"], name: "index_languages_offers_on_level_id"
    t.index ["offer_id"], name: "index_languages_offers_on_offer_id"
  end

  create_table "levels", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "limitations", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "limitations_users", force: :cascade do |t|
    t.bigint "limitation_id", null: false
    t.bigint "user_id", null: false
    t.index ["limitation_id"], name: "index_limitations_users_on_limitation_id"
    t.index ["user_id"], name: "index_limitations_users_on_user_id"
  end

  create_table "nationalities", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "country_id"
    t.index ["country_id"], name: "index_nationalities_on_country_id"
  end

  create_table "nationalities_users", force: :cascade do |t|
    t.bigint "nationality_id", null: false
    t.bigint "user_id", null: false
    t.index ["nationality_id"], name: "index_nationalities_users_on_nationality_id"
    t.index ["user_id"], name: "index_nationalities_users_on_user_id"
  end

  create_table "offer_on_demands", force: :cascade do |t|
    t.string "status"
    t.date "start_at"
    t.date "finish_at"
    t.bigint "offer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["offer_id"], name: "index_offer_on_demands_on_offer_id"
  end

  create_table "offer_required_experiences", force: :cascade do |t|
    t.integer "duration"
    t.bigint "duration_type_id", null: false
    t.bigint "offer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["duration_type_id"], name: "index_offer_required_experiences_on_duration_type_id"
    t.index ["offer_id"], name: "index_offer_required_experiences_on_offer_id"
  end

  create_table "offer_salaries", force: :cascade do |t|
    t.bigint "offer_id", null: false
    t.bigint "currency_id", null: false
    t.bigint "salary_period_id", null: false
    t.integer "from"
    t.integer "to"
    t.boolean "is_range"
    t.index ["currency_id"], name: "index_offer_salaries_on_currency_id"
    t.index ["offer_id"], name: "index_offer_salaries_on_offer_id"
    t.index ["salary_period_id"], name: "index_offer_salaries_on_salary_period_id"
  end

  create_table "offer_types", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "offers", force: :cascade do |t|
    t.string "title"
    t.string "address"
    t.string "cellphone"
    t.string "description"
    t.integer "vacancies_quantity"
    t.datetime "close_date"
    t.boolean "immediate_start"
    t.boolean "required_experience"
    t.string "description_responsibilities"
    t.datetime "release_date"
    t.string "status", default: "preview"
    t.bigint "city_id"
    t.bigint "offer_type_id"
    t.bigint "contract_type_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "work_mode_id"
    t.bigint "company_id"
    t.string "slug"
    t.boolean "created_by_admin", default: false
    t.bigint "educational_degree_id"
    t.boolean "confidential", default: false
    t.index ["city_id"], name: "index_offers_on_city_id"
    t.index ["company_id"], name: "index_offers_on_company_id"
    t.index ["contract_type_id"], name: "index_offers_on_contract_type_id"
    t.index ["educational_degree_id"], name: "index_offers_on_educational_degree_id"
    t.index ["offer_type_id"], name: "index_offers_on_offer_type_id"
    t.index ["work_mode_id"], name: "index_offers_on_work_mode_id"
  end

  create_table "offers_curriculum_vitaes", force: :cascade do |t|
    t.bigint "offer_id", null: false
    t.bigint "curriculum_vitae_id", null: false
    t.float "affinity_percentage", null: false
    t.string "version", null: false
    t.string "sexes_offer"
    t.string "sexes_curriculum_vitae"
    t.string "available_work_days_offer"
    t.string "available_work_days_curriculum_vitae"
    t.string "educational_degree_offer"
    t.string "educational_degree_curriculum_vitae"
    t.string "educational_level_offer"
    t.string "educational_level_curriculum_vitae"
    t.string "driving_licences_offer"
    t.string "driving_licences_curriculum_vitae"
    t.string "technical_skills_offer"
    t.string "technical_skills_curriculum_vitae"
    t.string "contract_type_id_offer"
    t.string "contract_type_id_curriculum_vitae"
    t.string "to_learn_skills_offer"
    t.string "to_learn_skills_curriculum_vitae"
    t.string "languages_list_offer"
    t.string "languages_list_curriculum_vitae"
    t.string "job_categories_offer"
    t.string "job_categories_curriculum_vitae"
    t.string "working_days_offer"
    t.string "working_days_curriculum_vitae"
    t.string "work_mode_id_offer"
    t.string "work_mode_id_curriculum_vitae"
    t.string "soft_skills_offer"
    t.string "soft_skills_curriculum_vitae"
    t.string "vehicles_offer"
    t.string "vehicles_curriculum_vitae"
    t.string "city_id_offer"
    t.string "city_id_curriculum_vitae"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["curriculum_vitae_id"], name: "index_offers_curriculum_vitaes_on_curriculum_vitae_id"
    t.index ["offer_id"], name: "index_offers_curriculum_vitaes_on_offer_id"
  end

  create_table "offers_requirements", force: :cascade do |t|
    t.bigint "offer_id", null: false
    t.bigint "requirement_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["offer_id"], name: "index_offers_requirements_on_offer_id"
    t.index ["requirement_id"], name: "index_offers_requirements_on_requirement_id"
  end

  create_table "offers_responsibilities", force: :cascade do |t|
    t.bigint "offer_id", null: false
    t.bigint "responsibility_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["offer_id"], name: "index_offers_responsibilities_on_offer_id"
    t.index ["responsibility_id"], name: "index_offers_responsibilities_on_responsibility_id"
  end

  create_table "offers_sexes", id: false, force: :cascade do |t|
    t.bigint "offer_id", null: false
    t.bigint "sex_id", null: false
    t.index ["offer_id", "sex_id"], name: "index_offers_sexes_on_offer_id_and_sex_id"
    t.index ["sex_id", "offer_id"], name: "index_offers_sexes_on_sex_id_and_offer_id"
  end

  create_table "offers_soft_skills", force: :cascade do |t|
    t.bigint "offer_id", null: false
    t.bigint "soft_skill_id", null: false
    t.index ["offer_id"], name: "index_offers_soft_skills_on_offer_id"
    t.index ["soft_skill_id"], name: "index_offers_soft_skills_on_soft_skill_id"
  end

  create_table "offers_technical_skills", force: :cascade do |t|
    t.bigint "offer_id", null: false
    t.bigint "technical_skill_id", null: false
    t.bigint "level_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["level_id"], name: "index_offers_technical_skills_on_level_id"
    t.index ["offer_id"], name: "index_offers_technical_skills_on_offer_id"
    t.index ["technical_skill_id"], name: "index_offers_technical_skills_on_technical_skill_id"
  end

  create_table "offers_terms", force: :cascade do |t|
    t.integer "time"
    t.bigint "term_id", null: false
    t.bigint "offer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["offer_id"], name: "index_offers_terms_on_offer_id"
    t.index ["term_id"], name: "index_offers_terms_on_term_id"
  end

  create_table "offers_vehicles", force: :cascade do |t|
    t.bigint "offer_id", null: false
    t.bigint "vehicle_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["offer_id"], name: "index_offers_vehicles_on_offer_id"
    t.index ["vehicle_id"], name: "index_offers_vehicles_on_vehicle_id"
  end

  create_table "offers_work_positions", force: :cascade do |t|
    t.bigint "offer_id", null: false
    t.bigint "work_position_id", null: false
    t.index ["offer_id"], name: "index_offers_work_positions_on_offer_id"
    t.index ["work_position_id"], name: "index_offers_work_positions_on_work_position_id"
  end

  create_table "offers_working_days", force: :cascade do |t|
    t.bigint "offer_id", null: false
    t.bigint "working_day_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["offer_id"], name: "index_offers_working_days_on_offer_id"
    t.index ["working_day_id"], name: "index_offers_working_days_on_working_day_id"
  end

  create_table "recommendations", force: :cascade do |t|
    t.string "recommendation"
    t.bigint "curriculum_vitae_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "back_to_work_score"
    t.bigint "curriculum_vitaes_id"
    t.index ["curriculum_vitae_id"], name: "index_recommendations_on_curriculum_vitae_id"
    t.index ["curriculum_vitaes_id"], name: "index_recommendations_on_curriculum_vitaes_id"
  end

  create_table "recommendations_soft_skills", force: :cascade do |t|
    t.bigint "recommendation_id", null: false
    t.bigint "soft_skill_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["recommendation_id"], name: "index_recommendations_soft_skills_on_recommendation_id"
    t.index ["soft_skill_id"], name: "index_recommendations_soft_skills_on_soft_skill_id"
  end

  create_table "recommendations_technical_skills", force: :cascade do |t|
    t.bigint "recommendation_id", null: false
    t.bigint "technical_skill_id", null: false
    t.index ["recommendation_id"], name: "index_recommendations_technical_skills_on_recommendation_id"
    t.index ["technical_skill_id"], name: "index_recommendations_technical_skills_on_technical_skill_id"
  end

  create_table "relationship_times", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "relationships", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "requirements", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "responsibilities", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "salary_periods", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sexes", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "soft_skills", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "states", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "country_id"
    t.index ["country_id"], name: "index_states_on_country_id"
  end

  create_table "technical_skill_categories", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "technical_skills", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "create_by_admin", default: false
  end

  create_table "technical_skills_work_experiences", force: :cascade do |t|
    t.bigint "technical_skill_id"
    t.bigint "work_experience_id"
    t.index ["technical_skill_id"], name: "index_technical_skills_work_experiences_on_technical_skill_id"
    t.index ["work_experience_id"], name: "index_technical_skills_work_experiences_on_work_experience_id"
  end

  create_table "terms", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.string "last_name"
    t.date "birthday"
    t.string "contact_number"
    t.string "identification_number"
    t.string "about_me"
    t.bigint "sex_id"
    t.bigint "document_type_id"
    t.bigint "contract_type_id"
    t.bigint "work_mode_id"
    t.bigint "educational_degree_id"
    t.bigint "city_id"
    t.text "image"
    t.string "cv_file"
    t.integer "residence_city_id"
    t.integer "born_city_id"
    t.index ["born_city_id"], name: "index_users_on_born_city_id"
    t.index ["city_id"], name: "index_users_on_city_id"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["contract_type_id"], name: "index_users_on_contract_type_id"
    t.index ["document_type_id"], name: "index_users_on_document_type_id"
    t.index ["educational_degree_id"], name: "index_users_on_educational_degree_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["residence_city_id"], name: "index_users_on_residence_city_id"
    t.index ["sex_id"], name: "index_users_on_sex_id"
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
    t.index ["work_mode_id"], name: "index_users_on_work_mode_id"
  end

  create_table "users_limitations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "limitation_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["limitation_id"], name: "index_users_limitations_on_limitation_id"
    t.index ["user_id"], name: "index_users_limitations_on_user_id"
  end

  create_table "users_nationalities", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "nationality_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["nationality_id"], name: "index_users_nationalities_on_nationality_id"
    t.index ["user_id"], name: "index_users_nationalities_on_user_id"
  end

  create_table "users_vehicles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "vehicle_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_users_vehicles_on_user_id"
    t.index ["vehicle_id"], name: "index_users_vehicles_on_vehicle_id"
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "visits", force: :cascade do |t|
    t.bigint "curriculum_vitae_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "curriculum_vitaes_id"
    t.index ["curriculum_vitae_id"], name: "index_visits_on_curriculum_vitae_id"
    t.index ["curriculum_vitaes_id"], name: "index_visits_on_curriculum_vitaes_id"
  end

  create_table "work_experiences", force: :cascade do |t|
    t.bigint "city_id"
    t.bigint "job_category_id", null: false
    t.bigint "work_methodology_id"
    t.bigint "contract_type_id"
    t.bigint "curriculum_vitae_id"
    t.bigint "work_position_id", null: false
    t.date "started_at"
    t.date "finished_at"
    t.string "company_name"
    t.boolean "still_in_progress"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["city_id"], name: "index_work_experiences_on_city_id"
    t.index ["contract_type_id"], name: "index_work_experiences_on_contract_type_id"
    t.index ["curriculum_vitae_id"], name: "index_work_experiences_on_curriculum_vitae_id"
    t.index ["job_category_id"], name: "index_work_experiences_on_job_category_id"
    t.index ["work_methodology_id"], name: "index_work_experiences_on_work_methodology_id"
    t.index ["work_position_id"], name: "index_work_experiences_on_work_position_id"
  end

  create_table "work_methodologies", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "work_modes", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "work_positions", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "working_days", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "acknowledgments", "cities"
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "age_ranges", "offers"
  add_foreign_key "applied_offers", "applied_offer_statuses"
  add_foreign_key "applied_offers", "offers"
  add_foreign_key "available_work_days_curriculum_vitaes", "available_work_days"
  add_foreign_key "available_work_days_curriculum_vitaes", "curriculum_vitaes"
  add_foreign_key "available_work_days_offers", "available_work_days"
  add_foreign_key "available_work_days_offers", "offers"
  add_foreign_key "cities", "states"
  add_foreign_key "companies", "cities"
  add_foreign_key "companies", "employees_ranges"
  add_foreign_key "companies", "industries"
  add_foreign_key "companies_users", "companies"
  add_foreign_key "companies_users", "users"
  add_foreign_key "company_transitions", "companies"
  add_foreign_key "curriculum_vitae_salaries", "currencies"
  add_foreign_key "curriculum_vitae_salaries", "curriculum_vitaes"
  add_foreign_key "curriculum_vitae_salaries", "salary_periods"
  add_foreign_key "curriculum_vitaes", "cities"
  add_foreign_key "curriculum_vitaes", "contract_types"
  add_foreign_key "curriculum_vitaes", "labor_disponibilities"
  add_foreign_key "curriculum_vitaes", "users"
  add_foreign_key "curriculum_vitaes", "work_modes"
  add_foreign_key "curriculum_vitaes_job_categories", "curriculum_vitaes"
  add_foreign_key "curriculum_vitaes_job_categories", "job_categories"
  add_foreign_key "curriculum_vitaes_languages", "curriculum_vitaes"
  add_foreign_key "curriculum_vitaes_languages", "languages"
  add_foreign_key "curriculum_vitaes_languages", "levels"
  add_foreign_key "curriculum_vitaes_offer_types", "curriculum_vitaes"
  add_foreign_key "curriculum_vitaes_offer_types", "offer_types"
  add_foreign_key "curriculum_vitaes_soft_skills", "soft_skills"
  add_foreign_key "curriculum_vitaes_technical_skills", "curriculum_vitaes"
  add_foreign_key "curriculum_vitaes_technical_skills", "job_categories"
  add_foreign_key "curriculum_vitaes_technical_skills", "levels"
  add_foreign_key "curriculum_vitaes_technical_skills", "technical_skills"
  add_foreign_key "curriculum_vitaes_vehicles", "curriculum_vitaes"
  add_foreign_key "curriculum_vitaes_vehicles", "vehicles"
  add_foreign_key "curriculum_vitaes_work_modes", "curriculum_vitaes"
  add_foreign_key "curriculum_vitaes_work_modes", "work_modes"
  add_foreign_key "curriculum_vitaes_working_days", "curriculum_vitaes"
  add_foreign_key "curriculum_vitaes_working_days", "working_days"
  add_foreign_key "driving_licences_offers", "driving_licences"
  add_foreign_key "driving_licences_offers", "offers"
  add_foreign_key "driving_licences_users", "driving_licences"
  add_foreign_key "driving_licences_users", "users"
  add_foreign_key "educational_degrees_users", "educational_degrees"
  add_foreign_key "educational_degrees_users", "users"
  add_foreign_key "educational_levels_offers", "educational_levels"
  add_foreign_key "educational_levels_offers", "offers"
  add_foreign_key "functions_offers", "functions"
  add_foreign_key "functions_offers", "offers"
  add_foreign_key "job_aids_offers", "job_aids"
  add_foreign_key "job_aids_offers", "offers"
  add_foreign_key "job_categories_offers", "job_categories"
  add_foreign_key "job_categories_offers", "offers"
  add_foreign_key "languages_offers", "languages"
  add_foreign_key "languages_offers", "levels"
  add_foreign_key "languages_offers", "offers"
  add_foreign_key "limitations_users", "limitations"
  add_foreign_key "limitations_users", "users"
  add_foreign_key "nationalities", "countries"
  add_foreign_key "nationalities_users", "nationalities"
  add_foreign_key "nationalities_users", "users"
  add_foreign_key "offer_on_demands", "offers"
  add_foreign_key "offer_required_experiences", "duration_types"
  add_foreign_key "offer_required_experiences", "offers"
  add_foreign_key "offer_salaries", "currencies"
  add_foreign_key "offer_salaries", "offers"
  add_foreign_key "offer_salaries", "salary_periods"
  add_foreign_key "offers", "cities"
  add_foreign_key "offers", "contract_types"
  add_foreign_key "offers", "educational_degrees"
  add_foreign_key "offers", "offer_types"
  add_foreign_key "offers", "work_modes"
  add_foreign_key "offers_requirements", "offers"
  add_foreign_key "offers_requirements", "requirements"
  add_foreign_key "offers_responsibilities", "offers"
  add_foreign_key "offers_responsibilities", "responsibilities"
  add_foreign_key "offers_sexes", "offers"
  add_foreign_key "offers_sexes", "sexes"
  add_foreign_key "offers_soft_skills", "offers"
  add_foreign_key "offers_soft_skills", "soft_skills"
  add_foreign_key "offers_technical_skills", "levels"
  add_foreign_key "offers_technical_skills", "offers"
  add_foreign_key "offers_technical_skills", "technical_skills"
  add_foreign_key "offers_terms", "offers"
  add_foreign_key "offers_terms", "terms"
  add_foreign_key "offers_vehicles", "offers"
  add_foreign_key "offers_vehicles", "vehicles"
  add_foreign_key "offers_work_positions", "offers"
  add_foreign_key "offers_work_positions", "work_positions"
  add_foreign_key "offers_working_days", "offers"
  add_foreign_key "offers_working_days", "working_days"
  add_foreign_key "recommendations_soft_skills", "recommendations"
  add_foreign_key "recommendations_soft_skills", "soft_skills"
  add_foreign_key "recommendations_technical_skills", "recommendations"
  add_foreign_key "recommendations_technical_skills", "technical_skills"
  add_foreign_key "states", "countries"
  add_foreign_key "technical_skills_work_experiences", "technical_skills"
  add_foreign_key "technical_skills_work_experiences", "work_experiences"
  add_foreign_key "users", "cities"
  add_foreign_key "users", "contract_types"
  add_foreign_key "users", "document_types"
  add_foreign_key "users", "educational_degrees"
  add_foreign_key "users", "sexes"
  add_foreign_key "users", "work_modes"
  add_foreign_key "users_limitations", "limitations"
  add_foreign_key "users_limitations", "users"
  add_foreign_key "users_nationalities", "nationalities"
  add_foreign_key "users_nationalities", "users"
  add_foreign_key "users_vehicles", "users"
  add_foreign_key "users_vehicles", "vehicles"
  add_foreign_key "work_experiences", "cities"
  add_foreign_key "work_experiences", "contract_types"
  add_foreign_key "work_experiences", "curriculum_vitaes"
  add_foreign_key "work_experiences", "job_categories"
  add_foreign_key "work_experiences", "work_methodologies"
  add_foreign_key "work_experiences", "work_positions"
end
