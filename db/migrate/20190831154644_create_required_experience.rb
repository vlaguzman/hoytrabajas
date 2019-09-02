class CreateRequiredExperience < ActiveRecord::Migration[6.0]
  def change
    create_table :required_experiences do |t|
      t.integer :duration
      t.references :duration_type, null: false, foreign_key: true
      t.references :offer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
