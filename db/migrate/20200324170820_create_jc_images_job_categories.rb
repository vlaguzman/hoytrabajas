class CreateJcImagesJobCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :jc_images_job_categories do |t|
      t.references :job_categories, null: false, foreign_key: true
      t.references :jc_images, null: false, foreign_key: true

      t.timestamps null: false
    end
  end
end
