class CreateOffersTerms < ActiveRecord::Migration[6.0]
  def change
    create_table :offers_terms do |t|
      t.integer :time

      t.references :term, null: false, foreign_key: true
      t.references :offer, null: false, foreign_key: true
      t.timestamps
    end
  end
end