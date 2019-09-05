class ChangeStatusInOffers < ActiveRecord::Migration[6.0]
  def change
    change_column :offers, :status, :string
  end
end
