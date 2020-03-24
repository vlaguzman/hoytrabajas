class CreateJcImages < ActiveRecord::Migration[6.0]
  def change
    create_table :jc_images do |t|
      t.string :description
      t.timestamps
    end
  end
end
