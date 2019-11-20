class AddOperationFlagToOffers < ActiveRecord::Migration[6.0]
  def change
    add_column :offers, :created_by_admin, :boolean, default: false
  end
end
