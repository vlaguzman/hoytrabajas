class CreateIndustry < ActiveRecord::Migration[6.0]
  def change
    create_table :industries do |t|
      t.string :description
      t.timestamps
    end
  end
end
