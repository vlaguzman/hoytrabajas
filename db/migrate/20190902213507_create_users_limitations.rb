class CreateUsersLimitations < ActiveRecord::Migration[6.0]
  def change
    create_table :users_limitations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :limitation, null: false, foreign_key: true
      t.timestamps
    end
  end
end
