class ChangeTableName < ActiveRecord::Migration[6.0]
  def change
    rename_table :users_educational_degrees, :educational_degrees_users
  end
end
