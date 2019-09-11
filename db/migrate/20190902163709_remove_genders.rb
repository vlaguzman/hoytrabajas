class RemoveGenders < ActiveRecord::Migration[6.0]
  def change
    remove_column :offers, :gender_id
    drop_table :genders
  end
end
