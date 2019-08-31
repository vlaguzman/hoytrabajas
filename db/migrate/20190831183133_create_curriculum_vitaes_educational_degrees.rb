class CreateCurriculumVitaesEducationalDegrees < ActiveRecord::Migration[6.0]
  def change
    create_table :curriculum_vitaes_educational_degrees do |t|
      t.string   :curriculum_vitae_id
      t.index    :curriculum_vitae_id, unique: true, name: "cv_id"
      t.string   :educational_degree_id
      t.index    :educational_degree_id, unique: true, name: "edu_degree_id"
    end
  end
end
