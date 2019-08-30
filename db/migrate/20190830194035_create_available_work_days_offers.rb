class CreateAvailableWorkDaysOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :available_work_days_offers do |t|
      t.references :available_work_day, null: false, foreign_key: true
      t.references :offer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
