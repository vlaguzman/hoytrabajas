class CreateJoinTableOffersSexes < ActiveRecord::Migration[6.0]
  def change
    create_join_table :offers, :sexes, column_options: { null: false, foreign_key: true } do |t|
      t.index [:offer_id, :sex_id]
      t.index [:sex_id, :offer_id]
    end
  end
end
