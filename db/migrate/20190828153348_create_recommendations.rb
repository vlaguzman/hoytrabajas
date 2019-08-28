class CreateRecommendations < ActiveRecord::Migration[6.0]
  def change
    create_table :recommendations do |t|
      t.string :recommendation
      t.references :curriculum_vitae, null: false, foreign_key: true
      t.timestamps
    end
  end
end
