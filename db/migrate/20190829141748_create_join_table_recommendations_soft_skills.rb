class CreateJoinTableRecommendationsSoftSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :recommendations_soft_skills do |t|
      t.references :recommendation, null: false, foreign_key: true
      t.references :soft_skill, null: false, foreign_key: true

      t.timestamps
    end
  end
end
