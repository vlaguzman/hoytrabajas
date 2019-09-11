class CreateCurriculumVitaesJobCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :curriculum_vitaes_job_categories do |t|
      t.references :curriculum_vitae, null: false, foreign_key: true
      t.references :job_category, null: false, foreign_key: true
      t.timestamps
    end
  end
end
