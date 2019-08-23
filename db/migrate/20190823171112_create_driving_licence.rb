class CreateDrivingLicence < ActiveRecord::Migration[6.0]
  def change
    create_table :driving_licences do |t|
      t.string :description
      t.timestamps
    end
  end
end
