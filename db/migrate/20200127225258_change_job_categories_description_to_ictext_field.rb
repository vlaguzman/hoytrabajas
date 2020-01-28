class ChangeJobCategoriesDescriptionToIctextField < ActiveRecord::Migration[6.0]
  def up
    change_column :job_categories, :description, :citext
  end

  def down
    change_column :job_categories, :description, :string
  end
end
