class ChangeCurriculumVitaesSalaries < ActiveRecord::Migration[6.0]
  def self.up
    rename_table :curriculum_vitaes_salaries, :curriculum_vitae_salaries
  end

  def self.down
    rename_table :curriculum_vitae_salaries, :curriculum_vitaes_salaries
  end
end
