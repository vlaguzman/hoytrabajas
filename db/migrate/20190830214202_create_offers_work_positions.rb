class CreateOffersWorkPositions < ActiveRecord::Migration[6.0]
  def change
    create_table :offers_work_positions do |t|
      t.references :offer, null: false, foreign_key: true
      t.references :work_position, null: false, foreign_key: true
    end
  end
end
