class AddColumnsUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name,                   :string
    add_column :users, :last_name,              :string
    add_column :users, :birthday,               :date
    add_column :users, :contact_number,         :string
    add_column :users, :identification_number,  :string
    add_column :users, :about_me,               :string

    add_reference :users, :sex, null: false, foreign_key: true
    add_reference :users, :document_type, null: false, foreign_key: true
    add_reference :users, :contract_type, null: false, foreign_key: true
    add_reference :users, :work_mode, null: false, foreign_key: true
  end
end
