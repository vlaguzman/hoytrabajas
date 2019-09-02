class CreateOffersWorkingDays < ActiveRecord::Migration[6.0]
  def change
    create_table :offers_working_days do |t|
      t.references :offer, null: false, foreign_key: true
      t.references :working_day, null: false, foreign_key: true

      t.timestamps
    end
  end
end
