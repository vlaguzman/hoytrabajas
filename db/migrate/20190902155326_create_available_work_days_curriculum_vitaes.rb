class CreateAvailableWorkDaysCurriculumVitaes < ActiveRecord::Migration[6.0]
  def change
    create_table :available_work_days_curriculum_vitaes do |t|
      t.string   :curriculum_vitae_id
      t.index    :curriculum_vitae_id, unique: true, name: "cv_av_work_day_cv_id"
      t.string   :available_work_day_id
      t.index    :available_work_day_id, unique: true, name: "cv_av_work_day_av_work_day_id"
    end
  end
end
