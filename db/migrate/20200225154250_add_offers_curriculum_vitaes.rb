class AddOffersCurriculumVitaes < ActiveRecord::Migration[6.0]
  def change
    create_table :offers_curriculum_vitaes do |t|
      t.references :offer, null: false, forein_key: true
      t.references :curriculum_vitae, null: false, forein_key: true

      t.float  :affinity_percentage, null: false
      t.string :version, null: false

      t.string :sexes_offer
      t.string :sexes_curriculum_vitae

      t.string :available_work_days_offer
      t.string :available_work_days_curriculum_vitae

      t.string :educational_degree_offer
      t.string :educational_degree_curriculum_vitae

      t.string :educational_level_offer
      t.string :educational_level_curriculum_vitae

      t.string :driving_licences_offer
      t.string :driving_licences_curriculum_vitae

      t.string :technical_skills_offer
      t.string :technical_skills_curriculum_vitae

      t.string :contract_type_id_offer
      t.string :contract_type_id_curriculum_vitae

      t.string :to_learn_skills_offer
      t.string :to_learn_skills_curriculum_vitae

      t.string :languages_list_offer
      t.string :languages_list_curriculum_vitae

      t.string :job_categories_offer
      t.string :job_categories_curriculum_vitae

      t.string :working_days_offer
      t.string :working_days_curriculum_vitae

      t.string :work_mode_id_offer
      t.string :work_mode_id_curriculum_vitae

      t.string :soft_skills_offer
      t.string :soft_skills_curriculum_vitae

      t.string :vehicles_offer
      t.string :vehicles_curriculum_vitae

      t.string :city_id_offer
      t.string :city_id_curriculum_vitae

      t.timestamps
    end
  end
end
