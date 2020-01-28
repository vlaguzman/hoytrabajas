class ChangeCitiesDescriptionToCitextdescription < ActiveRecord::Migration[6.0]
  def up
    enable_extension :unaccent
    enable_extension :citext

    change_column :cities, :description, :citext
  end

  def down
    change_column :cities, :description, :string
  end
end
