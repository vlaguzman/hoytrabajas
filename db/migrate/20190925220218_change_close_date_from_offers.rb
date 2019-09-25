class ChangeCloseDateFromOffers < ActiveRecord::Migration[6.0]
  def self.up
    change_column :offers, :close_date, :datetime, using: "close_date::timestamp without time zone"
    add_reference :companies, :city, foreign_key: true
  end

  def self.down
    change_column :offers, :close_date, :string
    remove_column :companies, :city_id
  end
end