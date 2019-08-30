class CreateJobAidsOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :job_aids_offers do |t|
      t.references :job_aid, null: false, foreign_key: true
      t.references :offer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
