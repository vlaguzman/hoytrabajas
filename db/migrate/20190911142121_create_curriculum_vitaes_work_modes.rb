class CreateCurriculumVitaesWorkModes < ActiveRecord::Migration[6.0]
  def change
    create_table :curriculum_vitaes_work_modes do |t|
      t.references :curriculum_vitae, null: false, foreign_key: true
      t.references :work_mode, null: false, foreign_key: true
      t.timestamps
    end
  end
end