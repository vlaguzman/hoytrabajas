class CreateRequirement < ActiveRecord::Migration[6.0]
  def change
    create_table :requirements do |t|
      t.string :description

      t.timestamps
    end
  end
end
