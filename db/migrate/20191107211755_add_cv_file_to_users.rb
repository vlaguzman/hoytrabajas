class AddCvFileToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :cv_file, :string
  end
end
