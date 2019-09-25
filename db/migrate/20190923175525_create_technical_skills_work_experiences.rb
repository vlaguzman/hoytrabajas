class CreateTechnicalSkillsWorkExperiences < ActiveRecord::Migration[6.0]
  def change
    create_table :technical_skills_work_experiences do |t|
      t.references :technical_skill, foreign_key: true
      t.references :work_experience, foreign_key: true
    end
  end
end
