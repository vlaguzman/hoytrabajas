class DeleteGender < ActiveRecord::Migration[6.0]
  def down
    drop_table :genders
  end
end
