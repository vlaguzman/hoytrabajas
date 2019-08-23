class CreateTechnicalSkillCategory < ActiveRecord::Migration[6.0]
  def change
    create_table :technical_skill_categories do |t|
      t.string :description
      t.timestamps
    end
  end
end
