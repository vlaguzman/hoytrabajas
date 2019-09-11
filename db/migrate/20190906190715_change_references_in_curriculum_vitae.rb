class ChangeReferencesInCurriculumVitae < ActiveRecord::Migration[6.0]
  def change
    change_column_null :users, :sex_id, true
    change_column_null :users, :document_type_id, true
    change_column_null :users, :contract_type_id, true
    change_column_null :users, :work_mode_id, true

    change_column_null :curriculum_vitaes, :user_id, true
    change_column_null :curriculum_vitaes, :city_id, true
    change_column_null :curriculum_vitaes, :labor_disponibility_id, true
    change_column_null :curriculum_vitaes, :work_mode_id, true
    change_column_null :curriculum_vitaes, :contract_type_id, true
  end
end
