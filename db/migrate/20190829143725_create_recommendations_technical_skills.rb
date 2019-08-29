class CreateRecommendationsTechnicalSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :recommendations_technical_skills do |t|
      t.references :recommendation, null: false, foreign_key: true
      t.references :technical_skill, null: false, foreign_key: true
    end
  end
end
