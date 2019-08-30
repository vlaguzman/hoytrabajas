class CreateVisit < ActiveRecord::Migration[6.0]
  def change
    create_table :visits do |t|
      t.references :curriculum_vitae, null: false, foreign_key: true

      t.timestamps
    end

    add_column :curriculum_vitaes, :visits_count, :integer
  end
end
