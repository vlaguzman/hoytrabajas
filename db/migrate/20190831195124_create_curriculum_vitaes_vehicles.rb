class CreateCurriculumVitaesVehicles < ActiveRecord::Migration[6.0]
  def change
    create_table :curriculum_vitaes_vehicles do |t|
      t.references :curriculum_vitae, null: false, foreign_key: true
      t.references :vehicle, null: false, foreign_key: true
    end
  end
end
