class CreateOffersTechnicalSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :offers_technical_skills do |t|
      t.references :offer, null: false, foreign_key: true
      t.references :technical_skill, null: false, foreign_key: true
      t.references :level, null: false, foreign_key: true

      t.timestamps
    end

  end
end
