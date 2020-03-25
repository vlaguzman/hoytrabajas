class AddJobCategoryImageToOffer < ActiveRecord::Migration[6.0]
  def change
    add_column :offers, :job_category_image, :string
  end
end
