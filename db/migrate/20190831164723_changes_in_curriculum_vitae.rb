class ChangesInCurriculumVitae < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :curriculum_vitaes_soft_skills, :curriculum_vitaes
    remove_foreign_key :acknowledgments, :curriculum_vitaes
    remove_foreign_key :recommendations, :curriculum_vitaes
    remove_foreign_key :visits, :curriculum_vitaes
    remove_foreign_key :applied_offers, :curriculum_vitaes

    drop_table :curriculum_vitaes

    create_table :curriculum_vitaes do |t|
      t.string   :area_code
      t.string   :about_me
      t.datetime :release_date
      t.string   :travel_disponibility
      t.string   :visits_count

      t.references :user, null: false, foreign_key: true
      t.references :city, null: false, foreign_key: true
      t.references :labor_disponibility, null: false, foreign_key: true

      t.timestamps
    end

    add_reference :curriculum_vitaes_soft_skills, :curriculum_vitaes
    add_reference :acknowledgments, :curriculum_vitaes
    add_reference :recommendations, :curriculum_vitaes
    add_reference :visits, :curriculum_vitaes
    add_reference :applied_offers, :curriculum_vitaes

  end
end
