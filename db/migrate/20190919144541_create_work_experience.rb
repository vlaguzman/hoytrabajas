class CreateWorkExperience < ActiveRecord::Migration[6.0]
  def change
    create_table :work_experiences do |t|
      t.references :job_category, null: false, foreign_key: true
      t.references :work_methodology, foreign_key: true
      t.references :contract_type, foreign_key: true
      t.references :curriculum_vitae, foreign_key: true
      t.references :work_position, null: false, foreign_key: true
      t.date :started_at
      t.date :finished_at
      t.string :company_name
      t.boolean :still_in_progress

      t.timestamps
    end
  end
end
