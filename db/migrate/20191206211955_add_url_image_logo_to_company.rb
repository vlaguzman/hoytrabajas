class AddUrlImageLogoToCompany < ActiveRecord::Migration[6.0]
  def change
    add_column :companies, :url_image_logo, :string
  end
end
