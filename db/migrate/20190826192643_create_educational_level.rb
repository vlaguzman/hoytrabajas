class CreateEducationalLevel < ActiveRecord::Migration[6.0]
  def change
    create_table :educational_levels do |t|
      t.string  :institution_name
      t.date    :start_date
      t.date    :finish_date
      t.string  :degree
      t.boolean :ongoing_study
      t.string  :city_id
      t.index   :city_id, unique: true
      t.string  :curriculum_vitae_id
      t.index   :curriculum_vitae_id, unique: true
      t.timestamps
    end
  end
end
