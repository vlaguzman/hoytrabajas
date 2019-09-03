class AddColumnsUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :last_name, :string
    add_reference :users, :natinalities
    add_reference :users, :document_types
    add_column :users, :identification_number, :string
    add_column :users, :about_me, :string
    add_reference :users, :sexes
    add_column :users, :birthday, :date
    add_reference :users, :limitations 
    add_reference :users, :educational_degrees
    add_reference :users, :contract_types
  end
end
