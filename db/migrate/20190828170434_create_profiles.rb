class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.references :curriculum_vitae, null: false, foreign_key: true
      t.string :name
      t.string :last_name
      t.references :nationality, null: false, foreign_key: true
      t.references :document_type, null: false, foreign_key: true
      t.string :document_number
      t.string :contact_number
      t.string :about_you
      t.references :gender, null: false, foreign_key: true
      t.date :birthday
      t.references :handicap, null: false, foreign_key: true
      t.references :educational_degree, null: false, foreign_key: true
      t.timestamps
    end
  end
end
