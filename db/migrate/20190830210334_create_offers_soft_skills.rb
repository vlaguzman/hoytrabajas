class CreateOffersSoftSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :offers_soft_skills do |t|
      t.references :offer, null: false, foreign_key: true
      t.references :soft_skill, null: false, foreign_key: true
    end
  end
end
