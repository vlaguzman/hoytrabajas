class CreateAgeRangeList < ActiveRecord::Migration[6.0]
  def change
    create_table :age_range_lists do |t|
      t.string :description

      t.timestamps
    end
  end
end