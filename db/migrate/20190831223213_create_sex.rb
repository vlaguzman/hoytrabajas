class CreateSex < ActiveRecord::Migration[6.0]
  def change
    create_table :sexes do |t|
      t.string :description
      t.references :users
      t.timestamps
    end
  end
end
