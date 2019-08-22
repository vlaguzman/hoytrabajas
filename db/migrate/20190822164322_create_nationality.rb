class CreateNationality < ActiveRecord::Migration[6.0]
  def change
    create_table :nationalities do |t|
      t.string :description
      t.timestamps
    end
  end
end
