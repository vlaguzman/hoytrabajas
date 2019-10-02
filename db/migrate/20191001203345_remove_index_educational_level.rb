class RemoveIndexEducationalLevel < ActiveRecord::Migration[6.0]
  def change
    remove_index :educational_levels, :city_id
    remove_index :educational_levels, :curriculum_vitae_id

    add_index :educational_levels, :city_id
    add_index :educational_levels, :curriculum_vitae_id
  end
end
