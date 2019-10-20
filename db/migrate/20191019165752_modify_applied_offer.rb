class ModifyAppliedOffer < ActiveRecord::Migration[6.0]
  def up
    remove_column :applied_offers, :note
  end

  def down
    add_column :applied_offers, :note, :string
  end
end
