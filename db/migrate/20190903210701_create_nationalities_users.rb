class CreateNationalitiesUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :nationalities_users do |t|
      t.references :nationality, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
    end
  end
end
