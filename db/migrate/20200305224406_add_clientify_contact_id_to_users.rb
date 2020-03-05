class AddClientifyContactIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :clientify_contact_id, :integer
  end
end
