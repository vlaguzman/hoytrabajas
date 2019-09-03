class DropDurations < ActiveRecord::Migration[6.0]
  def change
    drop_table :durations do |t|
      t.string :description, null: false
      t.timestamps null: false
    end
  end
end