class CreateCurriculumVitaesSalaries < ActiveRecord::Migration[6.0]
  def change
    create_table :curriculum_vitaes_salaries do |t|
      t.references :curriculum_vitae, null: false, foreign_key: true
      t.references :salary_period, null: false, foreign_key: true
      t.references :currency, null: false, foreign_key: true
      t.integer :from
      t.integer :to
    end
  end
end
