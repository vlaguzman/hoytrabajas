class CreateUsersEducationalDegrees < ActiveRecord::Migration[6.0]
  def change
    create_table :users_educational_degrees do |t|
      t.references :user, null: false, foreign_key: true
      t.references :educational_degree, null: false, foreign_key: true
      t.timestamps
    end
  end
end
