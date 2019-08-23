class CreateSoftSkill < ActiveRecord::Migration[6.0]
  def change
    create_table :soft_skills do |t|
      t.string :description
      t.timestamps
    end
  end
end