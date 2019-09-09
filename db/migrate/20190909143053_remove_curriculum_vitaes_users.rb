class RemoveCurriculumVitaesUsers < ActiveRecord::Migration[6.0]
  def change
    drop_table :curriculum_vitaes_users do |t|
      t.references :curriculum_vitae, null: false
      t.references :user, null: false
    end
  end
end
