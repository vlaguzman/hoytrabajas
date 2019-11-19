class CreateOffersRequirements < ActiveRecord::Migration[6.0]
  def change
    create_table :offers_requirements do |t|
      t.references :offer, null: false, foreign_key: true
      t.references :requirement, null: false, foreign_key: true

      t.timestamps
    end
  end
end
