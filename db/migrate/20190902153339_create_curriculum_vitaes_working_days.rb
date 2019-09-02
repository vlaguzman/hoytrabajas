class CreateCurriculumVitaesWorkingDays < ActiveRecord::Migration[6.0]
  def change
    create_table :curriculum_vitaes_working_days do |t|
      t.references :curriculum_vitae, null: false, foreign_key: true
      t.references :working_day, null: false, foreign_key: true
    end
  end
end
