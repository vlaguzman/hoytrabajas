class CreateCurriculumVitaesOfferTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :curriculum_vitaes_offer_types do |t|
      t.references :curriculum_vitae, null: false, foreign_key: true
      t.references :offer_type, null: false, foreign_key: true
      t.timestamps
    end
  end
end
