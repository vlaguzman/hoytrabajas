class CreateAcknowledgment < ActiveRecord::Migration[6.0]
  def change
    create_table :acknowledgments do |t|
      t.string :title
      t.datetime :start_date
      t.string :entity_name
      t.references :curriculum_vitae, null: false, foreign_key: true
    end
  end
end
