class CreateCurriculumVitaesLimitations < ActiveRecord::Migration[6.0]
  def change
    create_table :curriculum_vitaes_limitations do |t|
      t.references :curriculum_vitae, null: false, foreign_key: true
      t.references :limitation, null: false, foreign_key: true
    end
  end
end
