class CreateRelationshipTime < ActiveRecord::Migration[6.0]
  def change
    create_table :relationship_times do |t|
      t.string :description
      t.timestamps
    end
  end
end