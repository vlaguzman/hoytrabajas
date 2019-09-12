class ChangeAvailableWorkDaysCurriculumVitaes < ActiveRecord::Migration[6.0]
  def self.up
    change_column :available_work_days_curriculum_vitaes, :curriculum_vitae_id, :integer, using: 'curriculum_vitae_id::integer'
    change_column :available_work_days_curriculum_vitaes, :available_work_day_id, :integer, using: 'available_work_day_id::integer'

    remove_index :available_work_days_curriculum_vitaes, :curriculum_vitae_id
    remove_index :available_work_days_curriculum_vitaes, :available_work_day_id

    add_foreign_key :available_work_days_curriculum_vitaes, :available_work_days
    add_foreign_key :available_work_days_curriculum_vitaes, :curriculum_vitaes

    add_index :available_work_days_curriculum_vitaes, :curriculum_vitae_id, name: "cv_av_work_day_cv_id"
    add_index :available_work_days_curriculum_vitaes, :available_work_day_id, name: "cv_av_work_day_av_work_day_id"
  end

  def self.down
    remove_foreign_key :available_work_days_curriculum_vitaes, :available_work_days
    remove_foreign_key :available_work_days_curriculum_vitaes, :curriculum_vitaes

    add_index :available_work_days_curriculum_vitaes, :curriculum_vitae_id, name: "cv_av_work_day_cv_id"
    add_index :available_work_days_curriculum_vitaes, :available_work_day_id, name: "cv_av_work_day_av_work_day_id"

    change_column :available_work_days_curriculum_vitaes, :curriculum_vitae_id, :string
    change_column :available_work_days_curriculum_vitaes, :available_work_day_id, :string
  end
end
