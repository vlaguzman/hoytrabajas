class CreateCurriculumVitae < ActiveRecord::Migration[6.0]
  def change
    create_table :curriculum_vitaes do |t|
      t.string   :user_id
      t.index    :user_id, unique: true
      t.integer  :area_code
      t.string   :cellphone_number
      t.string   :city_id
      t.index    :city_id, unique: true
      t.string   :nationality_id
      t.index    :nationality_id, unique: true
      t.string   :identification_number, unique: true
      t.string   :tell_us
      t.datetime :release_date
      t.string   :labor_disponibility_id
      t.index    :labor_disponibility_id, unique: true
      t.string   :document_type_id
      t.index    :document_type_id, unique: true
      t.string   :handicap_id
      t.index    :handicap_id, unique: true
      t.string   :gender_id
      t.index    :gender_id, unique: true
      t.string   :work_type_id
      t.index    :work_type_id, unique: true
      t.string   :contract_type_id
      t.index    :contract_type_id, unique: true
      t.boolean  :travel_disponibility
      t.timestamps
    end
  end
end
