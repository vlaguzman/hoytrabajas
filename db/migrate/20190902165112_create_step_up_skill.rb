class CreateStepUpSkill < ActiveRecord::Migration[6.0]
  def change
    create_table :step_up_skills do |t|
      t.references :curriculum_vitae, null: false, foreign_key: true
      t.references :technical_skill, null: false, foreign_key: true
      t.timestamps
    end
  end
end
