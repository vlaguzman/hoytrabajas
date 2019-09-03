class RemoveUserFromOffer < ActiveRecord::Migration[6.0]

  def self.up
    change_table :offers do |t|
      t.references :company
    end

    remove_column :offers, :user_id
  end

  def self.down
    change_table :offers do |t|
      t.references :user
    end

    remove_column :offers, :company_id
  end
end
