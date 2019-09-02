class AddsSexToOffer < ActiveRecord::Migration[6.0]
  def change
    add_reference :offers, :sex, null: false, foreign_key: true
  end
end
