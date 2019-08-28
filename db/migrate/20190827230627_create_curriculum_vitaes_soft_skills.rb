class CreateCurriculumVitaesSoftSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :curriculum_vitaes_soft_skills do |t|
      t.references :curriculum_vitae, null: false, foreign_key: true
      t.references :soft_skill, null: false, foreign_key: true

      t.timestamps
    end
  end
end
