class CreateCurriculumVitaesTechnicalSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :curriculum_vitaes_technical_skills do |t|
      t.boolean :step_up

      t.references :job_category, null: false, foreign_key: true
      t.references :level, null: false, foreign_key: true
      t.references :curriculum_vitae, null: false, foreign_key: true
      t.references :technical_skill, null: false, foreign_key: true
      t.timestamps
    end
  end
end
