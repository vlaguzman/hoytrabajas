class CreateCurriculumVitaesLanguages < ActiveRecord::Migration[6.0]
  def change
    create_table :curriculum_vitaes_languages do |t|
      t.references :curriculum_vitae, null: false, foreign_key: true
      t.references :language, null: false, foreign_key: true

      t.timestamps
    end
  end
end
