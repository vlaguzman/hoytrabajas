class CreateCurriculumVitaesUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :curriculum_vitaes_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :curriculum_vitae, null: false, foreign_key: true
    end
  end
end
