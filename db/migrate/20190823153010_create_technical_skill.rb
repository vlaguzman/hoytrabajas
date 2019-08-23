class CreateTechnicalSkill < ActiveRecord::Migration[6.0]
  def change
    create_table :technical_skills do |t|
      t.string :description
      t.timestamps
    end
  end
end
