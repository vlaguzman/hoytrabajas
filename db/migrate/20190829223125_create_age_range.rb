class CreateAgeRange < ActiveRecord::Migration[6.0]
  def change
    create_table :age_ranges do |t|
      t.integer :from
      t.integer :to

      t.references :offer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
