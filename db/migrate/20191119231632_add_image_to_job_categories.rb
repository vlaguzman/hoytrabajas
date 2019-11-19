class AddImageToJobCategories < ActiveRecord::Migration[6.0]
  def change
    add_column :job_categories, :image, :string
  end
end
