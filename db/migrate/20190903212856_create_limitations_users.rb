class CreateLimitationsUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :limitations_users do |t|
      t.references :limitation, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
    end

    drop_table :curriculum_vitaes_limitations do |t|
      t.references :curriculum_vitae, null: false
      t.references :limitation, null: false
    end
  end
end
