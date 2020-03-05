class AddClientifyContactIdToCompanies < ActiveRecord::Migration[6.0]
  def change
    add_column :companies, :clientify_contact_id, :integer
  end
end
