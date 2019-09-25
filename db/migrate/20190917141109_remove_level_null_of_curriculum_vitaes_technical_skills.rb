class RemoveLevelNullOfCurriculumVitaesTechnicalSkills < ActiveRecord::Migration[6.0]
  def self.up
    remove_column :curriculum_vitaes_technical_skills, :level_id
    add_reference :curriculum_vitaes_technical_skills, :level, foreign_key: true
  end

  def self.down
    remove_column :curriculum_vitaes_technical_skills, :level_id
    add_reference :curriculum_vitaes_technical_skills, :level, foreign_key: true, null: false
  end
end
