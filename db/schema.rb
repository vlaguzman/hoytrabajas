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

ActiveRecord::Schema.define(version: 2019_08_30_143602) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "acknowledgments", force: :cascade do |t|
    t.string "title"
    t.datetime "start_date"
    t.string "entity_name"
    t.bigint "curriculum_vitae_id", null: false
    t.index ["curriculum_vitae_id"], name: "index_acknowledgments_on_curriculum_vitae_id"
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

  create_table "age_ranges", force: :cascade do |t|
    t.integer "from"
    t.integer "to"
    t.bigint "offer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["offer_id"], name: "index_age_ranges_on_offer_id"
  end

  create_table "available_work_days", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "contract_types", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "curriculum_vitaes", force: :cascade do |t|
    t.string "user_id"
    t.integer "area_code"
    t.string "cellphone_number"
    t.string "city_id"
    t.string "nationality_id"
    t.string "identification_number"
    t.string "tell_us"
    t.datetime "release_date"
    t.string "labor_disponibility_id"
    t.string "document_type_id"
    t.string "handicap_id"
    t.string "gender_id"
    t.string "work_type_id"
    t.string "contract_type_id"
    t.boolean "travel_disponibility"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "visits_count"
    t.index ["city_id"], name: "index_curriculum_vitaes_on_city_id", unique: true
    t.index ["contract_type_id"], name: "index_curriculum_vitaes_on_contract_type_id", unique: true
    t.index ["document_type_id"], name: "index_curriculum_vitaes_on_document_type_id", unique: true
    t.index ["gender_id"], name: "index_curriculum_vitaes_on_gender_id", unique: true
    t.index ["handicap_id"], name: "index_curriculum_vitaes_on_handicap_id", unique: true
    t.index ["labor_disponibility_id"], name: "index_curriculum_vitaes_on_labor_disponibility_id", unique: true
    t.index ["nationality_id"], name: "index_curriculum_vitaes_on_nationality_id", unique: true
    t.index ["user_id"], name: "index_curriculum_vitaes_on_user_id", unique: true
    t.index ["work_type_id"], name: "index_curriculum_vitaes_on_work_type_id", unique: true
  end

  create_table "curriculum_vitaes_soft_skills", force: :cascade do |t|
    t.bigint "curriculum_vitae_id", null: false
    t.bigint "soft_skill_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["curriculum_vitae_id"], name: "index_curriculum_vitaes_soft_skills_on_curriculum_vitae_id"
    t.index ["soft_skill_id"], name: "index_curriculum_vitaes_soft_skills_on_soft_skill_id"
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

  create_table "durations", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "educational_degrees", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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
    t.index ["city_id"], name: "index_educational_levels_on_city_id", unique: true
    t.index ["curriculum_vitae_id"], name: "index_educational_levels_on_curriculum_vitae_id", unique: true
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

  create_table "genders", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "handicaps", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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

  create_table "job_categories", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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

  create_table "nationalities", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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
    t.string "close_date"
    t.boolean "immediate_start"
    t.boolean "required_experience"
    t.string "description_responsibilities"
    t.datetime "release_date"
    t.integer "status"
    t.bigint "user_id", null: false
    t.bigint "city_id", null: false
    t.bigint "job_category_id", null: false
    t.bigint "offer_type_id", null: false
    t.bigint "gender_id", null: false
    t.bigint "work_type_id", null: false
    t.bigint "contract_type_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["city_id"], name: "index_offers_on_city_id"
    t.index ["contract_type_id"], name: "index_offers_on_contract_type_id"
    t.index ["gender_id"], name: "index_offers_on_gender_id"
    t.index ["job_category_id"], name: "index_offers_on_job_category_id"
    t.index ["offer_type_id"], name: "index_offers_on_offer_type_id"
    t.index ["user_id"], name: "index_offers_on_user_id"
    t.index ["work_type_id"], name: "index_offers_on_work_type_id"
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

  create_table "recommendations", force: :cascade do |t|
    t.string "recommendation"
    t.bigint "curriculum_vitae_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "back_to_work_score"
    t.index ["curriculum_vitae_id"], name: "index_recommendations_on_curriculum_vitae_id"
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

  create_table "salary_types", force: :cascade do |t|
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
  end

  create_table "terms", force: :cascade do |t|
    t.string "description"
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
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
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
    t.index ["curriculum_vitae_id"], name: "index_visits_on_curriculum_vitae_id"
  end

  create_table "work_positions", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "work_types", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "working_days", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "acknowledgments", "curriculum_vitaes"
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "age_ranges", "offers"
  add_foreign_key "curriculum_vitaes_soft_skills", "curriculum_vitaes"
  add_foreign_key "curriculum_vitaes_soft_skills", "soft_skills"
  add_foreign_key "functions_offers", "functions"
  add_foreign_key "functions_offers", "offers"
  add_foreign_key "offers", "cities"
  add_foreign_key "offers", "contract_types"
  add_foreign_key "offers", "genders"
  add_foreign_key "offers", "job_categories"
  add_foreign_key "offers", "offer_types"
  add_foreign_key "offers", "users"
  add_foreign_key "offers", "work_types"
  add_foreign_key "offers_terms", "offers"
  add_foreign_key "offers_terms", "terms"
  add_foreign_key "recommendations", "curriculum_vitaes"
  add_foreign_key "recommendations_soft_skills", "recommendations"
  add_foreign_key "recommendations_soft_skills", "soft_skills"
  add_foreign_key "recommendations_technical_skills", "recommendations"
  add_foreign_key "recommendations_technical_skills", "technical_skills"
  add_foreign_key "visits", "curriculum_vitaes"
end
