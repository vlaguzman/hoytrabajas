class CreateAvailableWorkDay < ActiveRecord::Migration[6.0]
  def change
    create_table :available_work_days do |t|
      t.string :description
      t.timestamps
    end
  end
end
