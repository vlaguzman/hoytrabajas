class AddWorkModeToCurriculumVitae < ActiveRecord::Migration[6.0]
  def change
    remove_reference :offers, :work_type

    add_reference :offers, :work_mode, null: false, foreign_key: true
    add_reference :curriculum_vitaes, :work_mode, null: false, foreign_key: true
  end
end
