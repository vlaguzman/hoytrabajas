class CreateEducationalDegree < ActiveRecord::Migration[6.0]
  def change
    create_table :educational_degrees do |t|
      t.string :description
      t.timestamps
    end
  end
end
