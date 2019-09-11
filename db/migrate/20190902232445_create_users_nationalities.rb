class CreateUsersNationalities < ActiveRecord::Migration[6.0]
  def change
    create_table :users_nationalities do |t|
      t.references :user, null: false, foreign_key: true
      t.references :nationality, null: false, foreign_key: true
      t.timestamps
    end
  end
end
