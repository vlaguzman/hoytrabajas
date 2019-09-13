class CreateDrivingLicencesUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :driving_licences_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :driving_licence, null: false, foreign_key: true
      t.timestamps
    end
  end
end
